import Foundation

struct IPv4Range {
    let addresses: [String]
    let canonicalCIDR: String

    enum ValidationError: LocalizedError {
        case invalid, tooLarge, notPrivate
        var errorDescription: String? {
            switch self {
            case .invalid: return "请输入有效 IPv4 CIDR，例如 192.168.1.0/24。"
            case .tooLarge: return "单次最多 1024 个地址，请使用 /22 或更小的范围。"
            case .notPrivate: return "首版仅支持私有 IPv4 网段和 169.254.0.0/16 链路本地地址。"
            }
        }
    }

    init(_ input: String) throws {
        let parts = input.trimmingCharacters(in: .whitespacesAndNewlines)
            .split(separator: "/", omittingEmptySubsequences: false)
        guard parts.count == 2, let ip = Self.number(String(parts[0])),
              let prefix = Int(parts[1]), (0...32).contains(prefix) else {
            throw ValidationError.invalid
        }
        guard prefix >= 22 else { throw ValidationError.tooLarge }
        let mask = prefix == 32 ? UInt32.max : UInt32.max << (32 - prefix)
        let start = ip & mask
        let end = start | ~mask
        guard Self.isLocal(start), Self.isLocal(end) else { throw ValidationError.notPrivate }
        canonicalCIDR = "\(Self.string(start))/\(prefix)"
        // /31 point-to-point and /32 host routes do not exclude endpoints.
        let first = prefix < 31 ? start + 1 : start
        let last = prefix < 31 ? end - 1 : end
        addresses = (first...last).map(Self.string)
    }

    // Discover the actual subnet independently of the scan-size/local-address policy.
    static func subnetCIDR(address: String, netmask: String) -> String? {
        guard let ip = number(address), let mask = number(netmask) else { return nil }
        let inverted = ~mask
        guard inverted & (inverted &+ 1) == 0 else { return nil }
        return "\(string(ip & mask))/\(mask.nonzeroBitCount)"
    }

    static func number(_ text: String) -> UInt32? {
        let octets = text.split(separator: ".", omittingEmptySubsequences: false)
        guard octets.count == 4 else { return nil }
        var result: UInt32 = 0
        for octet in octets {
            guard !octet.isEmpty, octet.utf8.allSatisfy({ (48...57).contains($0) }),
                  let value = UInt32(octet), value <= 255 else { return nil }
            result = (result << 8) | value
        }
        return result
    }

    static func string(_ value: UInt32) -> String {
        [24, 16, 8, 0].map { String((value >> $0) & 255) }.joined(separator: ".")
    }

    private static func isLocal(_ ip: UInt32) -> Bool {
        ip >> 24 == 10 || ip >> 20 == 0xAC1 ||
        ip >> 16 == 0xC0A8 || ip >> 16 == 0xA9FE
    }
}
