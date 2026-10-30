import Foundation

// Name and type hints gathered from Bonjour and reverse DNS; none of it is authoritative.
struct DeviceIdentity: Codable, Equatable {
    var hostname: String? = nil
    var names: [String] = []
    var services: [String] = []
    var model: String? = nil

    var isEmpty: Bool { hostname == nil && names.isEmpty && services.isEmpty && model == nil }

    var displayName: String? { names.first ?? hostname }

    var kind: String? {
        if let model, let kind = Self.kind(forModel: model) { return kind }
        for (prefix, label) in Self.serviceKinds where services.contains(where: { $0.hasPrefix(prefix) }) {
            return label
        }
        return nil
    }

    // Secondary line: type and model. The host name is omitted; it is the title when no name exists
    // and otherwise only repeats the friendly name in another spelling.
    var summary: String? {
        var parts: [String] = []
        if let kind { parts.append(kind) }
        if let model, model != kind { parts.append(model) }
        return parts.isEmpty ? nil : parts.joined(separator: " · ")
    }

    // Earlier values win so a later weaker source never replaces a name already shown.
    mutating func merge(_ other: DeviceIdentity) {
        if hostname == nil { hostname = other.hostname }
        if model == nil { model = other.model }
        for name in other.names where !names.contains(name) { names.append(name) }
        for service in other.services where !services.contains(service) { services.append(service) }
    }

    static func cleanHostname(_ raw: String, ip: String) -> String? {
        var name = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        while name.hasSuffix(".") { name.removeLast() }
        let lowered = name.lowercased()
        for suffix in [".local", ".lan", ".home", ".localdomain", ".home.arpa"] where lowered.hasSuffix(suffix) {
            name = String(name.dropLast(suffix.count))
            break
        }
        guard !name.isEmpty, name != ip, !name.lowercased().hasSuffix(".arpa"),
              !name.allSatisfy({ $0.isNumber || $0 == "-" || $0 == "." }) else { return nil }
        return String(name.prefix(64))
    }

    // Only fields a device itself advertises: friendly name (Chromecast "fn") and model ("model", "md").
    static func fromTXT(_ txt: [String: String]) -> (name: String?, model: String?) {
        func value(_ keys: [String]) -> String? {
            for key in keys {
                if let text = txt[key]?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty {
                    return String(text.prefix(64))
                }
            }
            return nil
        }
        return (value(["fn"]), value(["model", "md"]))
    }

    static func kind(forModel model: String) -> String? {
        let lowered = model.lowercased()
        return modelKinds.first { lowered.hasPrefix($0.prefix) }?.label
    }

    private static let modelKinds: [(prefix: String, label: String)] = [
        ("appletv", "Apple TV"), ("audioaccessory", "HomePod"), ("iphone", "iPhone"), ("ipad", "iPad"),
        ("watch", "Apple Watch"), ("macbook", "Mac 笔记本"), ("imac", "Mac"), ("macmini", "Mac"),
        ("macpro", "Mac"), ("macstudio", "Mac"), ("mac", "Mac"), ("chromecast", "Chromecast")
    ]

    private static let serviceKinds: [(String, String)] = [
        ("_mediaremotetv", "Apple TV"), ("_androidtvremote", "Android TV"),
        ("_googlecast", "Chromecast / Google TV"),
        ("_ipp", "打印机"), ("_printer", "打印机"), ("_pdl-datastream", "打印机"),
        ("_hap", "HomeKit 配件"), ("_homekit", "HomeKit 配件"),
        ("_smb", "电脑 / NAS"), ("_afpovertcp", "电脑 / NAS"), ("_workstation", "电脑"),
        ("_companion-link", "Apple 设备"), ("_rdlink", "Apple 设备"),
        ("_airplay", "AirPlay 设备"), ("_raop", "AirPlay 设备")
    ]
}
