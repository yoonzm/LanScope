import Foundation
import Combine
import Network

@MainActor
final class ScanViewModel: ObservableObject {
    @Published var cidr = "" {
        didSet {
            hasEditedCIDR = true
            networkMessage = nil
        }
    }
    @Published private(set) var networkMessage: String?
    @Published private(set) var hosts: [HostResult] = []
    @Published private(set) var completed = 0
    @Published private(set) var total = 0
    @Published private(set) var running = false
    @Published private(set) var status = "连接 Wi-Fi，确认网段后开始扫描。"
    @Published private(set) var diagnostic: String?
    @Published private(set) var history: [ScanRecord] = []
    @Published private(set) var historyError: String?
    @Published private(set) var settings = ScanSettings()
    private let settingsStore = ScanSettingsStore()
    private var scanSettings = ScanSettings()
    private let historyStore = ScanHistoryStore()
    private var startedAt = Date()
    private var scanCIDR = ""
    private var scanWiFiName: String?
    private lazy var wifiNameReader = WiFiNameReader()
    private let scanner = Scanner()
    private var session = UUID()
    private let networkMonitor = NWPathMonitor(requiredInterfaceType: .wifi)
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
        let record = ScanRecord(id: session, startedAt: startedAt, endedAt: Date(),
                                cidr: scanCIDR, wifiName: scanWiFiName, outcome: outcome,
                                completed: completed, total: total, hosts: hosts,
                                diagnostic: diagnostic, settings: scanSettings)
        history = historyStore.recent([record] + history)
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
            completed = 0
            total = range.addresses.count
            diagnostic = nil
            running = true
            scanSettings = settings
            status = "正在扫描…"
            session = UUID()
            startedAt = Date()
            scanCIDR = range.canonicalCIDR
            scanWiFiName = nil
            let current = session
            Task {
                guard session == current, running else { return }
                let name = await wifiNameReader.currentName()
                guard session == current, running else { return }
                scanWiFiName = name
                startedAt = Date()
                beginScan(range: range, session: current)
            }
        } catch {
            diagnostic = error.localizedDescription
        }
    }

    private func beginScan(range: IPv4Range, session current: UUID) {
        status = "正在扫描…"
        scanner.start(addresses: range.addresses, settings: scanSettings) { [weak self] update in
            DispatchQueue.main.async {
                guard let self, self.session == current, self.running else { return }
                self.completed = update.completed
                self.total = update.total
                if let host = update.host {
                    if let index = self.hosts.firstIndex(where: { $0.ip == host.ip }) {
                        self.hosts[index] = host
                    } else { self.hosts.append(host) }
                    self.hosts.sort {
                        (IPv4Range.number($0.ip) ?? 0) < (IPv4Range.number($1.ip) ?? 0)
                    }
                }
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

    func stop(background: Bool = false) {
        guard running else { return }
        saveHistory(outcome: background ? .background : .stopped)
        session = UUID()
        scanner.cancel()
        running = false
        status = background ? "进入后台，扫描已停止；已发现结果保留。" : "扫描已停止；已发现结果保留。"
    }
}
