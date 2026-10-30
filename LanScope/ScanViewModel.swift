import Foundation
import Combine
import Network

// Path updates may repeat; only the first one may resume the continuation.
private final class OneShot: @unchecked Sendable {
    private let lock = NSLock()
    private var fired = false

    func fire() -> Bool {
        lock.lock()
        defer { lock.unlock() }
        if fired { return false }
        fired = true
        return true
    }
}

private struct PausedScan {
    let cidr: String
    let network: NetworkSnapshot
    let wifiName: String?
    let done: Set<String>
}

@MainActor
final class ScanViewModel: ObservableObject {
    @Published var cidr = "" {
        didSet {
            hasEditedCIDR = true
            networkMessage = nil
            if cidr != pausedScan?.cidr { pausedScan = nil }
        }
    }
    @Published private(set) var networkMessage: String?
    @Published private(set) var currentWiFiName: String?
    @Published private(set) var hosts: [HostResult] = []
    @Published private(set) var completed = 0
    @Published private(set) var total = 0
    @Published private(set) var running = false
    @Published private(set) var status = "连接 Wi-Fi，确认网段后开始扫描。"
    @Published private(set) var diagnostic: String?
    @Published private(set) var history: [ScanRecord] = []
    @Published private(set) var historyError: String?
    @Published private(set) var settings = ScanSettings()
    // Set while a scan paused by the app going to the background can still continue.
    @Published private var pausedScan: PausedScan?
    var canResume: Bool { pausedScan != nil && !running }
    private let settingsStore = ScanSettingsStore()
    private var scanSettings = ScanSettings()
    private let historyStore = ScanHistoryStore()
    private var startedAt = Date()
    private var scanCIDR = ""
    private var scanWiFiName: String?
    private var scanNetwork: NetworkSnapshot?
    private var recordID = UUID()
    private lazy var wifiNameReader = WiFiNameReader()
    private let scanner = Scanner()
    private var session = UUID()
    private let networkMonitor = NWPathMonitor(requiredInterfaceType: .wifi)
    private var identities: [String: DeviceIdentity] = [:]
    private var hasEditedCIDR = false
    private var initialDetectionFinished = false

    init() {
        settings = settingsStore.load()
        do { history = try historyStore.load() }
        catch { historyError = "无法读取扫描历史：\(error.localizedDescription)" }
        networkMonitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async { self?.fillInitialNetwork(path: path) }
        }
        networkMonitor.start(queue: DispatchQueue(label: "LanScope.network"))
    }

    deinit { networkMonitor.cancel() }

    func refreshWiFiName() async {
        let name = await wifiNameReader.currentName()
        guard !Task.isCancelled else { return }
        currentWiFiName = name.flatMap { $0.isEmpty ? nil : $0 }
    }

    func saveSettings(pingOnly: Bool, portsText: String) throws {
        guard !running else { return }
        let updated = ScanSettings(pingOnly: pingOnly, ports: try ScanSettings.parsePorts(portsText))
        try settingsStore.save(updated)
        settings = updated
    }

    private func fillInitialNetwork(path: NWPath) {
        guard !initialDetectionFinished else { return }
        initialDetectionFinished = true
        networkMonitor.cancel()
        // Never overwrite an edit made while the first network callback was pending,
        // even if the user has since cleared the field.
        guard !hasEditedCIDR, !running else { return }
        guard let network = WiFiNetwork.current(path: path) else {
            networkMessage = "未能识别 Wi-Fi IPv4 网段，请手动输入扫描范围。"
            return
        }
        cidr = network.cidr
        do { _ = try IPv4Range(network.cidr) }
        catch { networkMessage = "已识别网段 \(network.cidr)。\(error.localizedDescription)请直接修改扫描范围。" }
    }

    func deleteHistory(ids: Set<UUID>) {
        let remaining = history.filter { !ids.contains($0.id) }
        do {
            try historyStore.save(remaining)
            history = remaining
            historyError = nil
        } catch { historyError = "删除未保存：\(error.localizedDescription)" }
    }

    private func saveHistory(outcome: ScanRecord.Outcome) {
        guard completed > 0 || !hosts.isEmpty else { return }
        let record = ScanRecord(id: recordID, startedAt: startedAt, endedAt: Date(),
                                cidr: scanCIDR, wifiName: scanWiFiName, outcome: outcome,
                                completed: completed, total: total, hosts: hosts,
                                diagnostic: diagnostic, settings: scanSettings)
        // A resumed scan keeps its record id so the paused snapshot is replaced, not duplicated.
        history = historyStore.recent([record] + history.filter { $0.id != record.id })
        do {
            try historyStore.save(history)
            historyError = nil
        } catch { historyError = "扫描历史尚未保存到本机：\(error.localizedDescription)" }
    }

    func start() {
        guard !running else { return }
        do {
            let range = try IPv4Range(cidr)
            cidr = range.canonicalCIDR
            hosts = []
            identities = [:]
            completed = 0
            total = range.addresses.count
            diagnostic = nil
            running = true
            scanSettings = settings
            status = "正在扫描…"
            session = UUID()
            recordID = UUID()
            pausedScan = nil
            startedAt = Date()
            scanCIDR = range.canonicalCIDR
            scanWiFiName = nil
            scanNetwork = nil
            let current = session
            Task {
                guard session == current, running else { return }
                let name = await wifiNameReader.currentName()
                let network = await currentNetwork()
                guard session == current, running else { return }
                scanWiFiName = name
                scanNetwork = network.map(Self.snapshot)
                startedAt = Date()
                beginScan(range: range, session: current)
            }
        } catch {
            diagnostic = error.localizedDescription
        }
    }

    private func beginScan(range: IPv4Range, session current: UUID, done: Set<String> = []) {
        status = "正在扫描…"
        scanner.start(addresses: range.addresses, settings: scanSettings, done: done) { [weak self] update in
            DispatchQueue.main.async {
                guard let self, self.session == current, self.running else { return }
                self.completed = update.completed
                self.total = update.total
                if let host = update.host { self.upsert(host) }
                if let item = update.identity { self.applyIdentity(item) }
                if let diagnostic = update.diagnostic { self.diagnostic = diagnostic }
                if update.finished {
                    self.running = false
                    self.saveHistory(outcome: update.completed == update.total ? .completed : .interrupted)
                    if update.completed != update.total {
                        self.status = "扫描因网络或权限问题中止，请检查后重试。"
                    } else if update.total == 0 {
                        self.status = "已排除本机地址，扫描范围内没有其他地址。"
                    } else if self.diagnostic != nil {
                        self.status = "扫描完成；部分端口探测出现错误，请查看提示。未发现的地址仍可能在线。"
                    } else {
                        self.status = self.scanSettings.pingOnly
                            ? "扫描完成；未回应 ping 的地址已跳过端口探测，不代表离线。若未发现设备，请检查局域网权限。"
                            : "扫描完成；未发现的地址仍可能在线。"
                    }
                }
            }
        }
    }

    // Scanner results replace a whole host, so identity hints are re-attached from the side table.
    private func upsert(_ host: HostResult) {
        var host = host
        host.identity = identities[host.ip]
        if let index = hosts.firstIndex(where: { $0.ip == host.ip }) {
            hosts[index] = host
        } else { hosts.append(host) }
        hosts.sort { (IPv4Range.number($0.ip) ?? 0) < (IPv4Range.number($1.ip) ?? 0) }
    }

    private func applyIdentity(_ item: HostIdentityUpdate) {
        var merged = identities[item.ip] ?? DeviceIdentity()
        merged.merge(item.identity)
        identities[item.ip] = merged
        if let index = hosts.firstIndex(where: { $0.ip == item.ip }) {
            hosts[index].identity = merged
        } else {
            // Devices that ignore ping and the probed ports can still announce themselves over Bonjour.
            upsert(HostResult(ip: item.ip, port: nil, open: nil, milliseconds: 0,
                              discoveredAt: Date(), ports: []))
        }
    }

    // Continue a scan paused in the background, but only if the Wi-Fi environment is unchanged.
    func resume() {
        guard !running, let paused = pausedScan, let range = try? IPv4Range(paused.cidr) else { return }
        running = true
        status = "正在检查网络…"
        session = UUID()
        let current = session
        Task {
            let name = await wifiNameReader.currentName()
            let network = await currentNetwork()
            guard session == current, running else { return }
            guard ScanResume.canResume(paused: paused.network, current: network.map(Self.snapshot),
                                       pausedWiFi: paused.wifiName, currentWiFi: name) else {
                running = false
                pausedScan = nil
                status = "网络已变化，无法继续扫描；已保留之前的结果，请确认网段后重新开始。"
                return
            }
            pausedScan = nil
            beginScan(range: range, session: current, done: paused.done)
        }
    }

    func stop(background: Bool = false) {
        guard running else { return }
        if background, let network = scanNetwork {
            // Results queued before the snapshot reach the main queue first, so keep accepting
            // updates until it arrives; the retained hosts then match the completed addresses.
            let current = session
            let cidr = scanCIDR, wifiName = scanWiFiName
            scanner.suspend { [weak self] done in
                guard let self, self.session == current, self.running else { return }
                self.saveHistory(outcome: .background)
                self.session = UUID()
                self.running = false
                self.pausedScan = PausedScan(cidr: cidr, network: network, wifiName: wifiName, done: done)
                self.status = "进入后台，扫描已暂停；已发现结果保留。回到前台后可点击“继续扫描”。"
            }
            return
        }
        saveHistory(outcome: background ? .background : .stopped)
        session = UUID()
        running = false
        pausedScan = nil
        scanner.cancel()
        status = background ? "进入后台，扫描已停止；已发现结果保留。" : "扫描已停止；已发现结果保留。"
    }

    private static func snapshot(_ network: WiFiNetwork) -> NetworkSnapshot {
        NetworkSnapshot(interface: network.interface, address: network.address, cidr: network.cidr)
    }

    private func currentNetwork() async -> WiFiNetwork? {
        await withCheckedContinuation { continuation in
            let monitor = NWPathMonitor(requiredInterfaceType: .wifi)
            let finished = OneShot()
            monitor.pathUpdateHandler = { path in
                guard finished.fire() else { return }
                monitor.cancel()
                continuation.resume(returning: WiFiNetwork.current(path: path))
            }
            monitor.start(queue: DispatchQueue(label: "LanScope.network.check"))
        }
    }
}
