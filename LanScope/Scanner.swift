import Foundation
import Network

struct ScanUpdate {
    let completed: Int
    let total: Int
    let host: HostResult?
    let diagnostic: String?
    let finished: Bool
}

// All mutable scan state, sockets and callbacks are confined to this queue.
final class Scanner {
    private let queue = DispatchQueue(label: "LanScope.scanner")
    private var settings = ScanSettings()
    private var generation = UUID()
    private var addresses: [String] = []
    private var next = 0
    private var completed = 0
    private var active: [UUID: NWConnection] = [:]
    private var pings: [UUID: PingProbe] = [:]
    private var timers: [UUID: DispatchWorkItem] = [:]
    private var monitor: NWPathMonitor?
    private var interface = ""
    private var callback: ((ScanUpdate) -> Void)?

    func start(addresses: [String], settings: ScanSettings, update: @escaping (ScanUpdate) -> Void) {
        queue.async {
            self.clear()
            self.addresses = addresses
            self.settings = settings
            self.next = 0
            self.completed = 0
            self.callback = update
            guard !addresses.isEmpty, !settings.ports.isEmpty else {
                self.abort("扫描地址或端口列表为空。")
                return
            }
            if settings.pingOnly { self.prepareWiFi() }
            else { self.launchBatch() }
        }
    }

    func cancel() { queue.async { self.clear() } }

    private func clear() {
        generation = UUID()
        monitor?.cancel()
        monitor = nil
        for timer in timers.values { timer.cancel() }
        for ping in pings.values { ping.cancel() }
        for connection in active.values {
            connection.stateUpdateHandler = nil
            connection.cancel()
        }
        timers.removeAll()
        pings.removeAll()
        active.removeAll()
        callback = nil
    }

    private func prepareWiFi() {
        let token = generation
        let id = UUID()
        let monitor = NWPathMonitor(requiredInterfaceType: .wifi)
        self.monitor = monitor
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self, self.generation == token, self.monitor != nil else { return }
            self.monitor?.cancel()
            self.monitor = nil
            self.timers.removeValue(forKey: id)?.cancel()
            guard let network = WiFiNetwork.current(path: path) else {
                self.abort("无法确定可用于 ping 的 Wi-Fi IPv4 接口，请检查网络后重试。")
                return
            }
            self.interface = network.interface
            self.launchBatch()
        }
        let timeout = DispatchWorkItem { [weak self] in
            guard let self, self.generation == token else { return }
            self.abort("等待 Wi-Fi 接口超时，请检查网络后重试。")
        }
        timers[id] = timeout
        queue.asyncAfter(deadline: .now() + 3, execute: timeout)
        monitor.start(queue: queue)
    }

    private func launchBatch() {
        let token = generation
        for _ in 0..<min(24, addresses.count) {
            guard generation == token else { return }
            launchNext()
        }
    }

    private func launchNext() {
        guard next < addresses.count else { return }
        let ip = addresses[next]
        next += 1
        let token = generation
        guard settings.pingOnly else {
            probe(ip: ip, portIndex: 0, host: nil, token: token)
            return
        }
        let id = UUID()
        let ping = PingProbe()
        pings[id] = ping
        ping.start(ip: ip, interface: interface, queue: queue) { [weak self] outcome in
            guard let self, self.generation == token else { return }
            self.pings.removeValue(forKey: id)
            switch outcome {
            case .reply(let milliseconds):
                let host = HostResult(ip: ip, port: nil, open: nil, milliseconds: milliseconds,
                                      discoveredAt: Date(), pingMilliseconds: milliseconds, ports: [])
                self.emit(host: host)
                self.probe(ip: ip, portIndex: 0, host: host, token: token)
            case .timeout:
                self.completed += 1
                self.emit()
                self.queue.async { [weak self] in
                    guard let self, self.generation == token else { return }
                    self.launchNext()
                }
            case .failure(let message):
                self.abort(message)
            }
        }
    }

    private func emit(host: HostResult? = nil, diagnostic: String? = nil) {
        callback?(ScanUpdate(completed: completed, total: addresses.count, host: host,
                             diagnostic: diagnostic, finished: completed == addresses.count))
    }

    private func abort(_ diagnostic: String) {
        let update = ScanUpdate(completed: completed, total: addresses.count,
                                host: nil, diagnostic: diagnostic, finished: true)
        let callback = callback
        clear()
        callback?(update)
    }

    private func probe(ip: String, portIndex: Int, host: HostResult?,
                       results: [PortResult] = [], token: UUID) {
        guard token == generation else { return }
        let id = UUID()
        let port = settings.ports[portIndex]
        let parameters = NWParameters.tcp
        parameters.requiredInterfaceType = .wifi
        let connection = NWConnection(host: NWEndpoint.Host(ip), port: NWEndpoint.Port(rawValue: port)!, using: parameters)
        active[id] = connection
        let started = DispatchTime.now().uptimeNanoseconds
        var waitingReason: String?

        func finish(_ state: PortResult.State, diagnostic: String? = nil, fatal: Bool = false) {
            guard token == self.generation, self.active.removeValue(forKey: id) != nil else { return }
            self.timers.removeValue(forKey: id)?.cancel()
            connection.stateUpdateHandler = nil
            connection.cancel()
            if fatal { self.abort(diagnostic ?? "网络探测失败。"); return }
            let milliseconds = Int((DispatchTime.now().uptimeNanoseconds - started) / 1_000_000)
            let results = results + [PortResult(port: port, state: state, milliseconds: milliseconds)]
            var host = host
            if host == nil, state == .open || state == .closed {
                host = HostResult(ip: ip, port: port, open: state == .open,
                                  milliseconds: milliseconds, discoveredAt: Date())
            }
            host?.ports = results
            let last = portIndex + 1 == self.settings.ports.count
            if last { self.completed += 1 }
            self.emit(host: host, diagnostic: diagnostic)
            if last { self.launchNext() }
            else { self.probe(ip: ip, portIndex: portIndex + 1, host: host, results: results, token: token) }
        }

        connection.stateUpdateHandler = { state in
            switch state {
            case .ready: finish(.open)
            case .failed(let error):
                if case .posix(.ECONNREFUSED) = error { finish(.closed) }
                else if case .posix(.EACCES) = error {
                    finish(.error, diagnostic: "网络访问被拒绝，请检查局域网权限。", fatal: true)
                } else if case .posix(.EPERM) = error {
                    finish(.error, diagnostic: "系统不允许此网络操作，请检查权限。", fatal: true)
                } else if case .posix(.ETIMEDOUT) = error { finish(.noResponse) }
                else { finish(.error, diagnostic: "探测错误（不是离线证明）：\(error)") }
            case .waiting(let error):
                // Network.framework can report a refused TCP probe as waiting,
                // not only failed. It is evidence for this port, not a scan-wide
                // path failure; finish now so the deadline cannot abort all probes.
                if case .posix(.ECONNREFUSED) = error { finish(.closed) }
                else if case .posix(.ETIMEDOUT) = error { finish(.noResponse) }
                else {
                    waitingReason = "等待网络路径（\(ip):\(port)）：\(error)。请检查 Wi-Fi 和局域网权限后重试。"
                }
            case .preparing:
                // A recovered path must not retain an earlier waiting error.
                waitingReason = nil
            default: break
            }
        }
        let timer = DispatchWorkItem {
            finish(.noResponse, diagnostic: waitingReason, fatal: waitingReason != nil)
        }
        timers[id] = timer
        queue.asyncAfter(deadline: .now() + 1.5, execute: timer)
        connection.start(queue: queue)
    }
}
