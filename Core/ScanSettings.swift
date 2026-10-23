import Foundation

struct ScanSettings: Codable, Equatable {
    var pingOnly = true
    var ports: [UInt16] = [
        21, 22, 80, 443, 445, 548, 631, 2049,
        3000, 3306, 3389, 5000, 5001, 5432, 5900, 6379,
        8000, 8080, 8081, 8123, 8443, 9000, 9090, 32400
    ]

    var portsText: String { ports.map(String.init).joined(separator: ", ") }

    static func parsePorts(_ text: String) throws -> [UInt16] {
        let parts = text.components(separatedBy: CharacterSet(charactersIn: ",，;；").union(.whitespacesAndNewlines))
            .filter { !$0.isEmpty }
        var ports: [UInt16] = []
        var seen = Set<UInt16>()
        for part in parts {
            guard part.utf8.allSatisfy({ (48...57).contains($0) }),
                  let port = UInt16(part), port > 0 else { throw PortError.invalid }
            if seen.insert(port).inserted { ports.append(port) }
        }
        guard !ports.isEmpty else { throw PortError.invalid }
        return ports
    }

    enum PortError: LocalizedError {
        case invalid
        var errorDescription: String? { "请输入 1–65535 的端口号，用逗号或空格分隔，至少保留一个端口。" }
    }
}

struct ScanSettingsStore {
    var defaults: UserDefaults = .standard
    private let key = "LanScope.scanSettings.v1"

    func load() -> ScanSettings {
        guard let data = defaults.data(forKey: key),
              let settings = try? JSONDecoder().decode(ScanSettings.self, from: data),
              let ports = try? ScanSettings.parsePorts(settings.portsText),
              ports == settings.ports else { return ScanSettings() }
        return settings
    }

    func save(_ settings: ScanSettings) throws {
        _ = try ScanSettings.parsePorts(settings.portsText)
        defaults.set(try JSONEncoder().encode(settings), forKey: key)
    }
}
