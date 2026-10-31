import Foundation
import Darwin
import Network

// Per-host name lookups beyond Bonjour and reverse DNS. All unicast over the Wi-Fi interface,
// so they need only the existing local network permission, not the multicast entitlement.
enum NameProbes {
    // Blocking; call from a background queue.
    static func netBIOS(ip: String, interface: String) -> DeviceIdentity? {
        let id = UInt16.random(in: 1...UInt16.max)
        guard let reply = UDPExchange.send(NetBIOS.nodeStatusQuery(id: id), to: ip, port: NetBIOS.port,
                                           interface: interface, timeout: 1.2),
              let name = NetBIOS.computerName(fromNodeStatus: reply, id: id) else { return nil }
        return NetBIOS.identity(computerName: name, ip: ip)
    }

    // Blocking SSDP exchange, then an asynchronous fetch of the description document.
    static func upnp(ip: String, interface: String, completion: @escaping (DeviceIdentity?) -> Void) {
        guard let reply = UDPExchange.send(SSDP.searchRequest(ip: ip), to: ip, port: SSDP.port,
                                           interface: interface, timeout: 1.5),
              let location = SSDP.location(fromResponse: reply, ip: ip) else {
            completion(nil)
            return
        }
        HTTPDescriptionFetch.get(location) { data in
            let identity = data.flatMap(UPnPDescription.parse(httpResponse:))?.identity()
            completion(identity.flatMap { $0.isEmpty ? nil : $0 })
        }
    }
}

enum UDPExchange {
    // Sends one datagram and returns the first reply that comes from the same address.
    static func send(_ payload: [UInt8], to ip: String, port: UInt16, interface: String,
                     timeout: TimeInterval) -> [UInt8]? {
        let fd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)
        guard fd >= 0 else { return nil }
        defer { close(fd) }
        var index = if_nametoindex(interface)
        guard index != 0,
              setsockopt(fd, IPPROTO_IP, IP_BOUND_IF, &index, socklen_t(MemoryLayout.size(ofValue: index))) == 0
        else { return nil }
        var destination = sockaddr_in()
        destination.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        destination.sin_family = sa_family_t(AF_INET)
        destination.sin_port = port.bigEndian
        guard inet_pton(AF_INET, ip, &destination.sin_addr) == 1 else { return nil }
        let sent = payload.withUnsafeBytes { bytes in
            withUnsafePointer(to: &destination) {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                    sendto(fd, bytes.baseAddress, bytes.count, 0, $0, socklen_t(MemoryLayout<sockaddr_in>.size))
                }
            }
        }
        guard sent == payload.count else { return nil }
        let deadline = Date().addingTimeInterval(timeout)
        var buffer = [UInt8](repeating: 0, count: 2048)
        while true {
            let remaining = deadline.timeIntervalSinceNow
            guard remaining > 0 else { return nil }
            var descriptor = pollfd(fd: fd, events: Int16(POLLIN), revents: 0)
            let ready = poll(&descriptor, 1, Int32(max(1, remaining * 1000)))
            if ready < 0, errno == EINTR { continue }
            guard ready > 0 else { return nil }
            var source = sockaddr_in()
            var length = socklen_t(MemoryLayout<sockaddr_in>.size)
            let count = buffer.withUnsafeMutableBytes { bytes in
                withUnsafeMutablePointer(to: &source) {
                    $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                        recvfrom(fd, bytes.baseAddress, bytes.count, 0, $0, &length)
                    }
                }
            }
            // A port-unreachable reply surfaces as an error here: the service is not running.
            guard count > 0 else { return nil }
            if source.sin_addr.s_addr == destination.sin_addr.s_addr { return Array(buffer[0..<count]) }
        }
    }
}

// Bounded plain-HTTP GET over Wi-Fi without redirects or credentials, like the Web probes.
enum HTTPDescriptionFetch {
    private static let queue = DispatchQueue(label: "LanScope.upnp-description")

    static func get(_ url: URL, limit: Int = 131_072, timeout: TimeInterval = 3,
                    completion: @escaping (Data?) -> Void) {
        guard let host = url.host, let port = NWEndpoint.Port(rawValue: UInt16(url.port ?? 80)) else {
            completion(nil)
            return
        }
        let parameters = NWParameters.tcp
        parameters.requiredInterfaceType = .wifi
        let connection = NWConnection(host: NWEndpoint.Host(host), port: port, using: parameters)
        var received = Data()
        var finished = false
        func finish(_ success: Bool) {
            guard !finished else { return }
            finished = true
            connection.stateUpdateHandler = nil
            connection.cancel()
            completion(success && !received.isEmpty ? received : nil)
        }
        func receive() {
            connection.receive(minimumIncompleteLength: 1, maximumLength: 8192) { data, _, complete, error in
                guard !finished else { return }
                if let data { received.append(data) }
                if received.count > limit { finish(false) }
                else if complete || error != nil { finish(true) }
                else { receive() }
            }
        }
        connection.stateUpdateHandler = { state in
            switch state {
            case .ready:
                let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                var path = components?.percentEncodedPath ?? "/"
                if path.isEmpty { path = "/" }
                if let query = components?.percentEncodedQuery { path += "?" + query }
                let request = "GET \(path) HTTP/1.1\r\nHost: \(host):\(port.rawValue)\r\nAccept-Encoding: identity\r\nConnection: close\r\n\r\n"
                connection.send(content: Data(request.utf8), completion: .contentProcessed { error in
                    if error != nil { queue.async { finish(false) } } else { receive() }
                })
            case .failed, .cancelled: finish(false)
            default: break
            }
        }
        // Some servers ignore "Connection: close"; whatever arrived by the deadline is still parsed.
        queue.asyncAfter(deadline: .now() + timeout) { finish(true) }
        connection.start(queue: queue)
    }
}
