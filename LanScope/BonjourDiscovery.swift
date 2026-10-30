import Foundation
import Darwin

// Browses Bonjour services and reports the IPv4 identity of each resolved responder.
// Every type here must also be listed under NSBonjourServices in Info.plist.
final class BonjourDiscovery: NSObject, NetServiceBrowserDelegate, NetServiceDelegate {
    static let serviceTypes = [
        "_airplay._tcp", "_raop._tcp", "_googlecast._tcp", "_androidtvremote2._tcp",
        "_mediaremotetv._tcp", "_companion-link._tcp", "_rdlink._tcp", "_device-info._tcp",
        "_homekit._tcp", "_hap._tcp", "_smb._tcp", "_afpovertcp._tcp", "_workstation._tcp",
        "_ipp._tcp", "_printer._tcp", "_spotify-connect._tcp", "_http._tcp", "_ssh._tcp"
    ]

    // Main thread only; NetService needs a run loop.
    private var browsers: [NetServiceBrowser] = []
    private var services: [NetService] = []
    private var handler: ((String, DeviceIdentity) -> Void)?

    func start(handler: @escaping (String, DeviceIdentity) -> Void) {
        DispatchQueue.main.async {
            self.handler = handler
            for type in Self.serviceTypes {
                let browser = NetServiceBrowser()
                browser.delegate = self
                browser.searchForServices(ofType: type + ".", inDomain: "local.")
                self.browsers.append(browser)
            }
        }
    }

    func stop() {
        DispatchQueue.main.async {
            self.handler = nil
            for browser in self.browsers { browser.delegate = nil; browser.stop() }
            for service in self.services { service.delegate = nil; service.stop() }
            self.browsers.removeAll()
            self.services.removeAll()
        }
    }

    func netServiceBrowser(_ browser: NetServiceBrowser, didFind service: NetService, moreComing: Bool) {
        guard handler != nil else { return }
        service.delegate = self
        services.append(service)
        service.resolve(withTimeout: 4)
    }

    func netServiceDidResolveAddress(_ sender: NetService) {
        guard let handler else { return }
        let addresses = (sender.addresses ?? []).compactMap(Self.ipv4)
        guard !addresses.isEmpty else { return }
        var txt: [String: String] = [:]
        if let data = sender.txtRecordData() {
            for (key, value) in NetService.dictionary(fromTXTRecord: data) {
                txt[key.lowercased()] = String(data: value, encoding: .utf8)
            }
        }
        let hints = DeviceIdentity.fromTXT(txt)
        var identity = DeviceIdentity()
        identity.services = [sender.type.trimmingCharacters(in: CharacterSet(charactersIn: "."))]
        identity.model = hints.model
        // Workstation instance names embed a MAC address, so they are not shown as names.
        if let friendly = hints.name { identity.names = [friendly] }
        else if !sender.name.isEmpty, !sender.type.hasPrefix("_workstation") {
            identity.names = [String(sender.name.prefix(64))]
        }
        if let host = sender.hostName,
           let name = addresses.first.flatMap({ DeviceIdentity.cleanHostname(host, ip: $0) }) {
            identity.hostname = name
        }
        for address in addresses { handler(address, identity) }
    }

    func netService(_ sender: NetService, didNotResolve errorDict: [String: NSNumber]) {
        services.removeAll { $0 === sender }
    }

    private static func ipv4(_ data: Data) -> String? {
        data.withUnsafeBytes { raw -> String? in
            guard raw.count >= MemoryLayout<sockaddr_in>.size,
                  raw.loadUnaligned(as: sockaddr.self).sa_family == sa_family_t(AF_INET) else { return nil }
            var address = raw.loadUnaligned(as: sockaddr_in.self).sin_addr
            var buffer = [CChar](repeating: 0, count: Int(INET_ADDRSTRLEN))
            guard inet_ntop(AF_INET, &address, &buffer, socklen_t(buffer.count)) != nil else { return nil }
            return String(cString: buffer)
        }
    }
}
