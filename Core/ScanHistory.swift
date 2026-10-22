import Foundation

struct HostResult: Identifiable, Codable {
    let ip: String
    let port: UInt16?
    let open: Bool?
    let milliseconds: Int
    let discoveredAt: Date
    var pingMilliseconds: Int? = nil
    var ports: [PortResult]? = nil
    var id: String { ip }
}

struct PortResult: Codable, Identifiable {
    enum State: String, Codable {
        case open, closed, noResponse, error
        var title: String {
            switch self {
            case .open: return "开放"
            case .closed: return "拒绝连接"
            case .noResponse: return "未响应"
            case .error: return "探测错误"
            }
        }
    }
    let port: UInt16
    let state: State
    let milliseconds: Int
    var id: UInt16 { port }
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
    // Snapshot at scan start; nil for older records or when access is unavailable.
    let wifiName: String?
    let outcome: Outcome
    let completed: Int
    let total: Int
    let hosts: [HostResult]
    let diagnostic: String?
    var settings: ScanSettings? = nil
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
