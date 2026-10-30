import Foundation
import Darwin

enum ReverseDNS {
    // Blocking PTR lookup through the system resolver; many routers answer with DHCP host names.
    static func lookup(_ ip: String) -> String? {
        var address = sockaddr_in()
        address.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        address.sin_family = sa_family_t(AF_INET)
        guard inet_pton(AF_INET, ip, &address.sin_addr) == 1 else { return nil }
        var buffer = [CChar](repeating: 0, count: 1025)
        let status = withUnsafePointer(to: &address) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                getnameinfo($0, socklen_t(MemoryLayout<sockaddr_in>.size),
                            &buffer, socklen_t(buffer.count), nil, 0, NI_NAMEREQD)
            }
        }
        guard status == 0 else { return nil }
        return DeviceIdentity.cleanHostname(String(cString: buffer), ip: ip)
    }
}
