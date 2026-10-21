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
    @Published private(set) var networkMessage: String? = "正在识别 Wi-Fi 网段…"
    @Published private(set) var hosts: [HostResult] = []
    @Published private(set) var completed = 0
    @Published private(set) var total = 0
    @Published private(set) var running = false
    @Published private(set) var status = "连接 Wi-Fi，确认网段后开始扫描。"
    @Published private(set) var diagnostic: String?
    @Published private(set) var history: [ScanRecord] = []
    @Published private(set) var historyError: String?
    private let historyStore = ScanHistoryStore()
    private var startedAt = Date()
    private var scanCIDR = ""
    private let scanner = Scanner()
    private var session = UUID()
    private let networkMonitor = NWPathMonitor(requiredInterfaceType: .wifi)
    private var hasEditedCIDR = false
    private var initialDetectionFinished = false

    init() {
        do { history = try historyStore.load() }
        catch { historyError = "无法读取扫描历史：\(error.localizedDescription)" }
        networkMonitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async { self?.fillInitialNetwork(path: path) }
        }
        networkMonitor.start(queue: DispatchQueue(label: "LanScope.network"))
    }

    deinit { networkMonitor.cancel() }

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
        networkMessage = "已根据本机 IP \(network.address) 自动填入，可直接修改。"
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
        guard completed > 0 else { return }
        let record = ScanRecord(id: session, startedAt: startedAt, endedAt: Date(),
                                cidr: scanCIDR, wifiName: nil, outcome: outcome,
                                completed: completed, total: total, hosts: hosts,
                                diagnostic: diagnostic)
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
            status = "正在探测 TCP 80、443、22、445…"
            session = UUID()
            startedAt = Date()
            scanCIDR = range.canonicalCIDR
            let current = session
            scanner.start(addresses: range.addresses) { [weak self] update in
                DispatchQueue.main.async {
                    guard let self, self.session == current, self.running else { return }
                    self.completed = update.completed
                    if let host = update.host {
                        self.hosts.append(host)
                        self.hosts.sort {
                            (IPv4Range.number($0.ip) ?? 0) < (IPv4Range.number($1.ip) ?? 0)
                        }
                    }
                    if let diagnostic = update.diagnostic { self.diagnostic = diagnostic }
                    if update.finished {
                        self.running = false
                        self.saveHistory(outcome: update.completed == update.total ? .completed : .interrupted)
                        self.status = update.completed == update.total
                            ? "扫描完成；未发现的地址仍可能在线。"
                            : "扫描因网络或权限问题中止，请检查后重试。"
                    }
                }
            }
        } catch {
            diagnostic = error.localizedDescription
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
