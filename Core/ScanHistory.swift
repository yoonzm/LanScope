import Foundation

struct HostResult: Identifiable, Codable {
    let ip: String
    let port: UInt16?
    let open: Bool?
    let milliseconds: Int
    let discoveredAt: Date
    var pingMilliseconds: Int? = nil
    var ports: [PortResult]? = nil
    // nil means this historical host predates Web detection.
    var webServices: [WebService]? = nil
    var id: String { ip }
}

struct WebService: Codable, Identifiable {
    let url: String
    let statusCode: Int
    var title: String? = nil
    var server: String? = nil
    var redirectURL: String? = nil
    // nil for HTTP, older records, or when no trust evaluation result is available.
    var certificateTrusted: Bool? = nil
    // Whether the root path serves a browsable page; nil for older records, which stay visible.
    var isPage: Bool? = nil
    var id: String { url }

    // Match the explicit nginx error page, not every HTTP 400 or port 443.
    var isHTTPToHTTPSMismatch: Bool {
        guard statusCode == 400, URL(string: url)?.scheme?.lowercased() == "http",
              let title else { return false }
        let normalized = title.split(whereSeparator: { $0.isWhitespace }).joined(separator: " ").lowercased()
        let message = "the plain http request was sent to https port"
        return normalized == message || normalized == "400 " + message
    }

    static func response(in data: Data, url: String) -> WebService? {
        guard let code = statusCode(in: data) else { return nil }
        var service = WebService(url: url, statusCode: code)
        service.isPage = false
        guard let separator = data.range(of: Data("\r\n\r\n".utf8)) else { return service }
        let header = String(decoding: data[..<separator.lowerBound], as: UTF8.self)
        var headers: [String: String] = [:]
        for line in header.components(separatedBy: "\r\n").dropFirst() {
            guard let colon = line.firstIndex(of: ":") else { continue }
            let name = line[..<colon].trimmingCharacters(in: .whitespaces).lowercased()
            let value = line[line.index(after: colon)...].trimmingCharacters(in: .whitespaces)
            if headers[name] == nil { headers[name] = value }
        }
        service.server = headers["server"].flatMap { $0.isEmpty ? nil : String($0.prefix(256)) }
        // AirPlay and similar protocols speak HTTP but never serve a page.
        let nonWebServer = headers["server"]?.lowercased().contains("airtunes") == true
        if (300...399).contains(code), let location = headers["location"], !location.isEmpty,
           let destination = URL(string: location, relativeTo: URL(string: url))?.absoluteURL,
           ["http", "https"].contains(destination.scheme?.lowercased() ?? "") {
            service.redirectURL = destination.absoluteString
        }
        let contentType = headers["content-type"]?.lowercased() ?? ""
        let htmlType = contentType.contains("text/html") || contentType.contains("application/xhtml+xml")
        switch code {
        case 200...299: service.isPage = htmlType && !nonWebServer
        case 300...399: service.isPage = service.redirectURL != nil && !nonWebServer
        case 401: service.isPage = headers["www-authenticate"] != nil && !nonWebServer
        default: service.isPage = false
        }
        // Request identity encoding; compressed responses still retain their metadata.
        guard headers["content-encoding"] == nil || headers["content-encoding"]?.lowercased() == "identity" else { return service }
        guard contentType.isEmpty || contentType.contains("text/html") || contentType.contains("application/xhtml+xml") else { return service }
        var body = Data(data[separator.upperBound...])
        if headers["transfer-encoding"]?.lowercased().contains("chunked") == true {
            body = unchunk(body)
        }
        let html: String
        if contentType.contains("charset=iso-8859-1") || contentType.contains("charset=windows-1252") {
            html = String(data: body, encoding: .windowsCP1252) ?? ""
        } else {
            html = String(decoding: body, as: UTF8.self)
        }
        if (200...299).contains(code), contentType.isEmpty, !nonWebServer, looksLikeHTML(html) { service.isPage = true }
        guard let expression = try? NSRegularExpression(pattern: "<title\\b[^>]*>(.*?)</title\\s*>",
                                                         options: [.caseInsensitive, .dotMatchesLineSeparators]),
              let match = expression.firstMatch(in: html, range: NSRange(html.startIndex..., in: html)),
              let range = Range(match.range(at: 1), in: html) else { return service }
        let title = decodeEntities(String(html[range])).split(whereSeparator: { $0.isWhitespace }).joined(separator: " ")
        if !title.isEmpty {
            service.title = String(title.prefix(256))
            if !nonWebServer { service.isPage = true }
        }
        return service
    }

    private static func looksLikeHTML(_ text: String) -> Bool {
        let head = text.prefix(1024).lowercased()
        return ["<!doctype html", "<html", "<head", "<body", "<title"].contains { head.contains($0) }
    }

    // Preserve complete and partial chunk payloads so a title split across chunks works.
    private static func unchunk(_ data: Data) -> Data {
        var cursor = data.startIndex
        var body = Data()
        while cursor < data.endIndex {
            guard let end = data.range(of: Data("\r\n".utf8), in: cursor..<data.endIndex),
                  let line = String(data: data[cursor..<end.lowerBound], encoding: .ascii),
                  let sizeText = line.split(separator: ";").first,
                  let size = Int(sizeText.trimmingCharacters(in: .whitespaces), radix: 16), size > 0 else { break }
            cursor = end.upperBound
            let count = min(size, data.endIndex - cursor)
            body.append(contentsOf: data[cursor..<(cursor + count)])
            cursor += count
            guard count == size, data.endIndex - cursor >= 2,
                  data[cursor] == 13, data[cursor + 1] == 10 else { break }
            cursor += 2
        }
        return body
    }

    private static func decodeEntities(_ text: String) -> String {
        guard let expression = try? NSRegularExpression(pattern: "&(#x[0-9a-fA-F]+|#[0-9]+|amp|lt|gt|quot|apos|nbsp);") else { return text }
        var result = text
        let named = ["amp": "&", "lt": "<", "gt": ">", "quot": "\"", "apos": "'", "nbsp": " "]
        for match in expression.matches(in: text, range: NSRange(text.startIndex..., in: text)).reversed() {
            guard let keyRange = Range(match.range(at: 1), in: text),
                  let range = Range(match.range, in: result) else { continue }
            let key = String(text[keyRange])
            var replacement = named[key]
            if key.hasPrefix("#") {
                let hex = key.hasPrefix("#x")
                if let value = UInt32(key.dropFirst(hex ? 2 : 1), radix: hex ? 16 : 10),
                   let scalar = UnicodeScalar(value) { replacement = String(scalar) }
            }
            if let replacement { result.replaceSubrange(range, with: replacement) }
        }
        return result
    }

    static func statusCode(in data: Data) -> Int? {
        guard let end = data.range(of: Data("\r\n".utf8)), end.lowerBound <= 1024,
              let line = String(data: data[..<end.lowerBound], encoding: .ascii) else { return nil }
        let parts = line.split(separator: " ", omittingEmptySubsequences: false)
        guard parts.count >= 3, ["HTTP/1.0", "HTTP/1.1"].contains(String(parts[0])),
              parts[1].count == 3, parts[1].allSatisfy({ $0.isASCII && $0.isNumber }),
              let code = Int(parts[1]), (100...599).contains(code) else { return nil }
        return code
    }
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
