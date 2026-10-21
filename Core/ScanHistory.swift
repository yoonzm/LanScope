import Foundation

struct HostResult: Identifiable, Codable {
    let ip: String
    let port: UInt16
    let open: Bool
    let milliseconds: Int
    let discoveredAt: Date
    var id: String { ip }
}

struct ScanRecord: Identifiable, Codable {
    enum Outcome: String, Codable {
        case completed, stopped, background, interrupted

        var title: String {
            switch self {
            case .completed: return "已完成"
            case .stopped: return "已停止 · 未完成"
            case .background: return "进入后台 · 未完成"
            case .interrupted: return "网络或权限异常 · 未完成"
            }
        }
    }

    let id: UUID
    let startedAt: Date
    let endedAt: Date
    let cidr: String
    // Snapshot metadata; nil until Wi-Fi name acquisition is supported.
    let wifiName: String?
    let outcome: Outcome
    let completed: Int
    let total: Int
    let hosts: [HostResult]
    let diagnostic: String?
}

struct ScanHistoryStore {
    let fileURL: URL

    init(fileURL: URL = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        .appendingPathComponent("LanScope", isDirectory: true)
        .appendingPathComponent("scan-history.json")) {
        self.fileURL = fileURL
    }

    func load() throws -> [ScanRecord] {
        guard FileManager.default.fileExists(atPath: fileURL.path) else { return [] }
        return recent(try JSONDecoder().decode([ScanRecord].self, from: Data(contentsOf: fileURL)))
    }

    func save(_ records: [ScanRecord]) throws {
        try FileManager.default.createDirectory(at: fileURL.deletingLastPathComponent(),
                                                withIntermediateDirectories: true)
        try JSONEncoder().encode(recent(records)).write(to: fileURL, options: .atomic)
    }

    func recent(_ records: [ScanRecord]) -> [ScanRecord] {
        Array(records.sorted { $0.startedAt > $1.startedAt }.prefix(30))
    }
}
