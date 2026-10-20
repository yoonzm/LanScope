import Foundation
import Network

struct HostResult: Identifiable {
    let ip: String
    let port: UInt16
    let open: Bool
    let milliseconds: Int
    let discoveredAt: Date
    var id: String { ip }
}

struct ScanUpdate {
    let completed: Int
    let total: Int
    let host: HostResult?
    let diagnostic: String?
    let finished: Bool
}

// All mutable scan state and NWConnection callbacks are confined to this queue.
final class Scanner {
    private let queue = DispatchQueue(label: "LanScope.scanner")
    private let ports: [UInt16] = [80, 443, 22, 445]
    private var generation = UUID()
    private var addresses: [String] = []
    private var next = 0
    private var completed = 0
    private var active: [UUID: NWConnection] = [:]
    private var timers: [UUID: DispatchWorkItem] = [:]
    private var callback: ((ScanUpdate) -> Void)?

    func start(addresses: [String], update: @escaping (ScanUpdate) -> Void) {
        queue.async {
            self.clear()
            self.addresses = addresses
            self.next = 0
            self.completed = 0
            self.callback = update
            for _ in 0..<min(24, addresses.count) { self.launchNext() }
        }
    }

    func cancel() {
        queue.async { self.clear() }
    }

    private func clear() {
        generation = UUID()
        for timer in timers.values { timer.cancel() }
        for connection in active.values {
            connection.stateUpdateHandler = nil
            connection.cancel()
        }
        timers.removeAll()
        active.removeAll()
        callback = nil
    }

    private func launchNext() {
        guard next < addresses.count else { return }
        let ip = addresses[next]
        next += 1
        probe(ip: ip, portIndex: 0, token: generation)
    }

    private func probe(ip: String, portIndex: Int, token: UUID) {
        guard token == generation else { return }
        let id = UUID()
        let port = ports[portIndex]
        let parameters = NWParameters.tcp
        parameters.requiredInterfaceType = .wifi
        let connection = NWConnection(
            host: NWEndpoint.Host(ip), port: NWEndpoint.Port(rawValue: port)!,
            using: parameters
        )
        active[id] = connection
        let started = DispatchTime.now().uptimeNanoseconds
        var waitingReason: String?

        func finish(open: Bool?, diagnostic: String? = nil, fatal: Bool = false) {
            guard token == self.generation, self.active.removeValue(forKey: id) != nil else { return }
            self.timers.removeValue(forKey: id)?.cancel()
            connection.stateUpdateHandler = nil
            connection.cancel()
            if fatal {
                let update = ScanUpdate(completed: self.completed, total: self.addresses.count,
                                        host: nil, diagnostic: diagnostic, finished: true)
                let callback = self.callback
                self.clear()
                callback?(update)
                return
            }
            if open == nil && portIndex + 1 < self.ports.count {
                if let diagnostic {
                    self.callback?(ScanUpdate(completed: self.completed, total: self.addresses.count,
                                              host: nil, diagnostic: diagnostic, finished: false))
                }
                self.probe(ip: ip, portIndex: portIndex + 1, token: token)
                return
            }
            let host = open.map {
                HostResult(ip: ip, port: port, open: $0,
                           milliseconds: Int((DispatchTime.now().uptimeNanoseconds - started) / 1_000_000),
                           discoveredAt: Date())
            }
            self.completed += 1
            self.callback?(ScanUpdate(completed: self.completed, total: self.addresses.count,
                                      host: host, diagnostic: diagnostic,
                                      finished: self.completed == self.addresses.count))
            self.launchNext()
        }

        connection.stateUpdateHandler = { state in
            switch state {
            case .ready:
                finish(open: true)
            case .failed(let error):
                if case .posix(.ECONNREFUSED) = error {
                    finish(open: false)
                } else if case .posix(.EACCES) = error {
                    finish(open: nil, diagnostic: "网络访问被拒绝，请检查局域网权限。", fatal: true)
                } else if case .posix(.EPERM) = error {
                    finish(open: nil, diagnostic: "系统不允许此网络操作，请检查权限。", fatal: true)
                } else if case .posix(.ETIMEDOUT) = error {
                    finish(open: nil)
                } else {
                    finish(open: nil, diagnostic: "探测错误（不是离线证明）：\(error)")
                }
            case .waiting(let error):
                // Waiting is not a definitive permission denial. Keep the connection
                // alive until its deadline, allowing a path/permission change.
                waitingReason = "等待网络路径：\(error)。请检查 Wi-Fi 和局域网权限后重试。"
            default:
                break
            }
        }
        let timer = DispatchWorkItem {
            finish(open: nil, diagnostic: waitingReason, fatal: waitingReason != nil)
        }
        timers[id] = timer
        queue.asyncAfter(deadline: .now() + 1.5, execute: timer)
        connection.start(queue: queue)
    }
}
