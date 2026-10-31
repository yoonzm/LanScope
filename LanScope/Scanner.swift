import Foundation
import Network
import Security

struct ScanUpdate {
    let completed: Int
    let total: Int
    let host: HostResult?
    let diagnostic: String?
    let finished: Bool
    var identity: HostIdentityUpdate? = nil
}

struct HostIdentityUpdate {
    let ip: String
    let identity: DeviceIdentity
}

// All mutable scan state, sockets and callbacks are confined to this queue.
final class Scanner {
    private let queue = DispatchQueue(label: "LanScope.scanner")
    private var settings = ScanSettings()
    private var generation = UUID()
    private var addresses: [String] = []
    private var next = 0
    private var completed = 0
    // Addresses whose probing fully finished; a suspended scan resumes with the rest.
    private var done = Set<String>()
    private var active: [UUID: NWConnection] = [:]
    private let connections = ProbeScheduler(limit: 64)
    private var pings: [UUID: PingProbe] = [:]
    private var timers: [UUID: DispatchWorkItem] = [:]
    private var monitor: NWPathMonitor?
    private var interface = ""
    private var callback: ((ScanUpdate) -> Void)?
    private let bonjour = BonjourDiscovery()
    private let nameLookups = DispatchQueue(label: "LanScope.reverse-dns", attributes: .concurrent)
    private var addressSet = Set<String>()
    private var lookedUp = Set<String>()
    private var bonjourStop: DispatchWorkItem?

    func start(addresses: [String], settings: ScanSettings, done: Set<String> = [],
               update: @escaping (ScanUpdate) -> Void) {
        queue.async {
            self.clear()
            self.addresses = addresses
            self.settings = settings
            self.next = 0
            self.done = done
            self.completed = 0
            self.callback = update
            guard !addresses.isEmpty, !settings.ports.isEmpty else {
                self.abort(tr("扫描地址或端口列表为空。"))
                return
            }
            // Both scan modes need the current local address before probing.
            self.prepareWiFi()
        }
    }

    func cancel() { queue.async { self.clear() } }

    // Stops probing and hands back the addresses that already finished, for a later resume.
    func suspend(completion: @escaping (Set<String>) -> Void) {
        queue.async {
            let snapshot = self.done
            self.clear()
            DispatchQueue.main.async { completion(snapshot) }
        }
    }

    private func markDone(_ ip: String) {
        if done.insert(ip).inserted { completed += 1 }
    }

    private func clear() {
        generation = UUID()
        connections.cancel()
        monitor?.cancel()
        monitor = nil
        for timer in timers.values { timer.cancel() }
        for ping in pings.values { ping.cancel() }
        for connection in active.values {
            connection.stateUpdateHandler = nil
            connection.cancel()
        }
        bonjour.stop()
        bonjourStop?.cancel()
        bonjourStop = nil
        lookedUp.removeAll()
        addressSet.removeAll()
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
                self.abort(tr("无法确定本机 Wi-Fi IPv4 地址，请检查网络后重试。"))
                return
            }
            self.interface = network.interface
            self.addresses.removeAll { $0 == network.address }
            self.emit()
            // A /32 targeting this device has no remote hosts to scan.
            guard !self.addresses.isEmpty else { return }
            self.done.formIntersection(self.addresses)
            self.completed = self.done.count
            if self.completed == self.addresses.count {
                self.emit()
                return
            }
            self.addressSet = Set(self.addresses)
            self.startBonjour(token: token)
            self.launchBatch()
        }
        let timeout = DispatchWorkItem { [weak self] in
            guard let self, self.generation == token else { return }
            self.abort(tr("等待 Wi-Fi 接口超时，请检查网络后重试。"))
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
        while next < addresses.count, done.contains(addresses[next]) { next += 1 }
        guard next < addresses.count else { return }
        let ip = addresses[next]
        next += 1
        let token = generation
        guard settings.pingOnly else {
            probePorts(ip: ip, host: nil, token: token)
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
                self.probePorts(ip: ip, host: host, token: token)
            case .timeout:
                self.markDone(ip)
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
        if let host { lookUpName(ip: host.ip) }
        callback?(ScanUpdate(completed: completed, total: addresses.count, host: host,
                             diagnostic: diagnostic, finished: completed == addresses.count))
        if completed == addresses.count { bonjour.stop() }
    }

    private func emit(identity: HostIdentityUpdate) {
        guard completed < addresses.count else { return }
        callback?(ScanUpdate(completed: completed, total: addresses.count, host: nil,
                             diagnostic: nil, finished: false, identity: identity))
    }

    // Bonjour only needs a few seconds; the browser also stops when the scan finishes.
    private func startBonjour(token: UUID) {
        bonjour.start { [weak self] ip, identity in
            self?.queue.async {
                guard let self, self.generation == token, self.addressSet.contains(ip) else { return }
                self.emit(identity: HostIdentityUpdate(ip: ip, identity: identity))
            }
        }
        let stop = DispatchWorkItem { [weak self] in self?.bonjour.stop() }
        bonjourStop = stop
        queue.asyncAfter(deadline: .now() + 25, execute: stop)
    }

    // Runs once per responding host, alongside its port probes: reverse DNS, NetBIOS and SSDP/UPnP.
    private func lookUpName(ip: String) {
        guard lookedUp.insert(ip).inserted else { return }
        let token = generation
        let interface = self.interface
        let deliver: (DeviceIdentity?) -> Void = { [weak self] identity in
            guard let identity else { return }
            self?.queue.async {
                guard let self, self.generation == token else { return }
                self.emit(identity: HostIdentityUpdate(ip: ip, identity: identity))
            }
        }
        nameLookups.async {
            deliver(ReverseDNS.lookup(ip).map { DeviceIdentity(hostname: $0) })
        }
        nameLookups.async {
            deliver(NameProbes.netBIOS(ip: ip, interface: interface))
        }
        nameLookups.async {
            NameProbes.upnp(ip: ip, interface: interface, completion: deliver)
        }
    }

    private func abort(_ diagnostic: String) {
        let update = ScanUpdate(completed: completed, total: addresses.count,
                                host: nil, diagnostic: diagnostic, finished: true)
        let callback = callback
        clear()
        callback?(update)
    }

    private func probePorts(ip: String, host: HostResult?, token: UUID) {
        var host = host
        let ports = settings.ports
        var nextPort = 0
        var finished = 0
        var results: [UInt16: PortResult] = [:]
        func launch() {
            guard token == self.generation, nextPort < ports.count else { return }
            let port = ports[nextPort]
            nextPort += 1
            self.connections.submit { id in
                self.probe(ip: ip, port: port, id: id, token: token) { result, diagnostic in
                    guard token == self.generation else { return }
                    results[port] = result
                    if host == nil, result.state == .open || result.state == .closed {
                        host = HostResult(ip: ip, port: port, open: result.state == .open,
                                          milliseconds: result.milliseconds, discoveredAt: Date())
                    }
                    host?.ports = ports.compactMap { results[$0] }
                    finished += 1
                    self.emit(host: host, diagnostic: diagnostic)
                    if finished == ports.count { self.identifyWeb(ip: ip, host: host, token: token) }
                    else { launch() }
                }
            }
        }
        for _ in 0..<min(4, ports.count) { launch() }
    }

    private func probe(ip: String, port: UInt16, id: UUID, token: UUID,
                       completion: @escaping (PortResult, String?) -> Void) {
        guard token == generation else { return }
        let parameters = NWParameters.tcp
        parameters.requiredInterfaceType = .wifi
        let connection = NWConnection(host: NWEndpoint.Host(ip), port: NWEndpoint.Port(rawValue: port)!, using: parameters)
        active[id] = connection
        let started = DispatchTime.now().uptimeNanoseconds
        var waitingReason: String?
        // Interpolated as a String so the localized format key stays "%@".
        let target = "\(ip):\(port)"

        func finish(_ state: PortResult.State, diagnostic: String? = nil) {
            guard token == self.generation, self.active.removeValue(forKey: id) != nil else { return }
            self.timers.removeValue(forKey: id)?.cancel()
            connection.stateUpdateHandler = nil
            connection.cancel()
            let milliseconds = Int((DispatchTime.now().uptimeNanoseconds - started) / 1_000_000)
            self.connections.finish(id)
            completion(PortResult(port: port, state: state, milliseconds: milliseconds), diagnostic)
        }

        connection.stateUpdateHandler = { state in
            switch state {
            case .ready: finish(.open)
            case .failed(let error):
                if case .posix(.ECONNREFUSED) = error { finish(.closed) }
                else if case .posix(.EACCES) = error {
                    finish(.error, diagnostic: tr("访问被拒绝（\(target)），请检查局域网权限；其余探测继续。"))
                } else if case .posix(.EPERM) = error {
                    finish(.error, diagnostic: tr("系统不允许此网络操作（\(target)），请检查权限；其余探测继续。"))
                } else if case .posix(.ETIMEDOUT) = error { finish(.noResponse) }
                else { finish(.error, diagnostic: tr("探测错误（\(target)，不是离线证明）：\(String(describing: error))。其余探测继续。")) }
            case .waiting(let error):
                // Network.framework can report refusal or permission errors as
                // waiting. Finish those ports now; allow other paths until the
                // deadline to recover without stopping the remaining probes.
                if case .posix(.ECONNREFUSED) = error { finish(.closed) }
                else if case .posix(.ETIMEDOUT) = error { finish(.noResponse) }
                else if case .posix(.EPERM) = error {
                    finish(.error, diagnostic: tr("系统不允许此网络操作（\(target)），请检查权限；其余探测继续。"))
                } else if case .posix(.EACCES) = error {
                    finish(.error, diagnostic: tr("访问被拒绝（\(target)），请检查局域网权限；其余探测继续。"))
                } else {
                    waitingReason = tr("等待网络路径超时（\(target)）：\(String(describing: error))。请检查 Wi-Fi 和局域网权限；其余探测继续。")
                }
            case .preparing:
                // A recovered path must not retain an earlier waiting error.
                waitingReason = nil
            default: break
            }
        }
        let timer = DispatchWorkItem {
            // A connection's path error is not evidence that every host is unreachable.
            finish(waitingReason == nil ? .noResponse : .error, diagnostic: waitingReason)
        }
        timers[id] = timer
        queue.asyncAfter(deadline: .now() + 1.5, execute: timer)
        connection.start(queue: queue)
    }

    // Keep each host in its existing concurrency slot until application probes finish.
    private func identifyWeb(ip: String, host: HostResult?, token: UUID) {
        guard token == generation else { return }
        guard var host else {
            markDone(ip)
            emit()
            launchNext()
            return
        }
        host.webServices = []
        let endpoints = (host.ports ?? []).filter { $0.state == .open }.flatMap { result in
            [false, true].map { (port: result.port, tls: $0) }
        }
        var nextEndpoint = 0
        var finished = 0
        func launch() {
            guard token == self.generation else { return }
            guard nextEndpoint < endpoints.count else { return }
            let endpoint = endpoints[nextEndpoint]
            nextEndpoint += 1
            self.probeWeb(ip: host.ip, port: endpoint.port, tls: endpoint.tls, token: token) { service in
                guard token == self.generation else { return }
                if let service, service.isPage != false, !service.isHTTPToHTTPSMismatch {
                    host.webServices?.append(service)
                    host.webServices?.sort { $0.url < $1.url }
                }
                finished += 1
                if finished == endpoints.count { self.markDone(host.ip) }
                self.emit(host: host)
                if finished == endpoints.count { self.launchNext() }
                else { launch() }
            }
        }
        if endpoints.isEmpty {
            markDone(host.ip)
            emit(host: host)
            launchNext()
        } else {
            for _ in 0..<min(4, endpoints.count) { launch() }
        }
    }

    private func probeWeb(ip: String, port: UInt16, tls: Bool, token: UUID, fetchPage: Bool = false,
                          completion: @escaping (WebService?) -> Void) {
        guard token == generation else { return }
        connections.submit { id in
            self.startWeb(ip: ip, port: port, tls: tls, token: token, fetchPage: fetchPage,
                          id: id, completion: completion)
        }
    }

    private func startWeb(ip: String, port: UInt16, tls: Bool, token: UUID, fetchPage: Bool,
                          id: UUID, completion: @escaping (WebService?) -> Void) {
        guard token == generation else { return }
        let tlsOptions = tls ? NWProtocolTLS.Options() : nil
        var certificateTrusted: Bool?
        if let tlsOptions {
            sec_protocol_options_set_verify_block(tlsOptions.securityProtocolOptions, { [weak self] _, trust, verify in
                guard let self, self.generation == token, self.active[id] != nil else {
                    verify(false)
                    return
                }
                let securityTrust = sec_trust_copy_ref(trust).takeRetainedValue()
                // Evaluate the scanned IP locally, without fetching certificates over other routes.
                let policyStatus = SecTrustSetPolicies(securityTrust, SecPolicyCreateSSL(true, ip as CFString))
                let fetchStatus = SecTrustSetNetworkFetchAllowed(securityTrust, false)
                guard policyStatus == errSecSuccess, fetchStatus == errSecSuccess else {
                    verify(true)
                    return
                }
                let evaluationStatus = SecTrustEvaluateAsyncWithError(securityTrust, self.queue) { [weak self] _, trusted, _ in
                    guard let self, self.generation == token, self.active[id] != nil else {
                        verify(false)
                        return
                    }
                    certificateTrusted = trusted
                    // Discovery only: keep TLS encryption but permit an untrusted peer certificate.
                    // A valid HTTP response is still required before creating a Web asset.
                    verify(true)
                }
                if evaluationStatus != errSecSuccess { verify(true) }
            }, queue)
        }
        let parameters = NWParameters(tls: tlsOptions, tcp: NWProtocolTCP.Options())
        parameters.requiredInterfaceType = .wifi
        let connection = NWConnection(host: NWEndpoint.Host(ip), port: NWEndpoint.Port(rawValue: port)!,
                                      using: parameters)
        active[id] = connection
        var received = Data()
        let url = "\(tls ? "https" : "http")://\(ip):\(port)/"
        let limit = fetchPage ? 65_536 : 16_384
        func finish() {
            guard token == self.generation, self.active.removeValue(forKey: id) != nil else { return }
            self.timers.removeValue(forKey: id)?.cancel()
            connection.stateUpdateHandler = nil
            connection.cancel()
            self.connections.finish(id)
            var service = WebService.response(in: received, url: url)
            service?.certificateTrusted = certificateTrusted
            if !fetchPage, let service {
                self.probeWeb(ip: ip, port: port, tls: tls, token: token, fetchPage: true) { page in
                    guard var page else { completion(service); return }
                    page.server = page.server ?? service.server
                    page.certificateTrusted = page.certificateTrusted ?? service.certificateTrusted
                    completion(page)
                }
            } else { completion(service) }
        }
        func receive() {
            connection.receive(minimumIncompleteLength: 1, maximumLength: min(4096, limit - received.count)) { data, _, complete, error in
                guard token == self.generation, self.active[id] != nil else { return }
                if let data { received.append(data) }
                let hasHeaders = received.range(of: Data("\r\n\r\n".utf8)) != nil
                let invalidStatus = received.range(of: Data("\r\n".utf8)) != nil && WebService.statusCode(in: received) == nil
                let hasTitle = fetchPage && WebService.response(in: received, url: url)?.title != nil
                if (!fetchPage && hasHeaders) || hasTitle || invalidStatus || received.count >= limit || complete || error != nil {
                    finish()
                } else { receive() }
            }
        }
        connection.stateUpdateHandler = { state in
            switch state {
            case .ready:
                // Read a bounded page after HEAD; never follow redirects or send credentials.
                let method = fetchPage ? "GET" : "HEAD"
                let request = "\(method) / HTTP/1.1\r\nHost: \(ip):\(port)\r\nAccept-Encoding: identity\r\nConnection: close\r\n\r\n"
                connection.send(content: Data(request.utf8), completion: .contentProcessed { error in
                    guard token == self.generation, self.active[id] != nil else { return }
                    if error != nil { finish() } else { receive() }
                })
            case .failed: finish()
            default: break
            }
        }
        let timer = DispatchWorkItem { finish() }
        timers[id] = timer
        queue.asyncAfter(deadline: .now() + (fetchPage ? 3 : 2), execute: timer)
        connection.start(queue: queue)
    }
}
