import Foundation
import XCTest
@testable import LanScopeCore

final class ScanHistoryTests: XCTestCase {
    func testLegacyHostAndNewPingOnlyHostRoundTrip() throws {
        let legacy = Data("""
        {"ip":"192.168.1.1","port":80,"open":false,"milliseconds":12,"discoveredAt":0}
        """.utf8)
        let old = try JSONDecoder().decode(HostResult.self, from: legacy)
        XCTAssertEqual(old.port, 80)
        XCTAssertNil(old.pingMilliseconds)
        XCTAssertNil(old.ports)
        XCTAssertNil(old.webServices)
        let host = HostResult(ip: "192.168.1.2", port: nil, open: nil, milliseconds: 3,
                              discoveredAt: Date(), pingMilliseconds: 3,
                              ports: [PortResult(port: 443, state: .noResponse, milliseconds: 1500)])
        let restored = try JSONDecoder().decode(HostResult.self, from: JSONEncoder().encode(host))
        XCTAssertEqual(restored.pingMilliseconds, 3)
        XCTAssertNil(restored.port)
        XCTAssertEqual(restored.ports?.first?.state, .noResponse)
        var scan = record(0)
        scan.settings = ScanSettings(pingOnly: false, ports: [8080])
        let restoredScan = try JSONDecoder().decode(ScanRecord.self, from: JSONEncoder().encode(scan))
        XCTAssertEqual(restoredScan.settings, scan.settings)
    }

    private func record(_ index: Int, wifiName: String? = nil) -> ScanRecord {
        ScanRecord(id: UUID(), startedAt: Date(timeIntervalSince1970: Double(index)),
                   endedAt: Date(timeIntervalSince1970: Double(index + 1)),
                   cidr: "192.168.1.0/24", wifiName: wifiName, outcome: .stopped,
                   completed: 10, total: 254,
                   hosts: [HostResult(ip: "192.168.1.1", port: 80, open: false,
                                      milliseconds: 12, discoveredAt: Date(timeIntervalSince1970: 1))],
                   diagnostic: nil)
    }

    func testWebResponseRecognition() {
        for code in [200, 301, 401, 403, 404, 405, 500] {
            XCTAssertEqual(WebService.statusCode(in: Data("HTTP/1.1 \(code) Response\r\n".utf8)), code)
        }
        XCTAssertEqual(WebService.statusCode(in: Data("HTTP/1.0 200 OK\r\n".utf8)), 200)
        for response in ["SSH-2.0-server\r\n", "HTTP/1.1 200", "HTTP/1.1 999 Invalid\r\n",
                         "HTTP/1.1 20 OK\r\n", "HTTP/2 200 OK\r\n", "HTTP/1.1  200 OK\r\n"] {
            XCTAssertNil(WebService.statusCode(in: Data(response.utf8)))
        }
        XCTAssertNil(WebService.statusCode(in: Data(("HTTP/1.1 200 " + String(repeating: "x", count: 1024) + "\r\n").utf8)))
    }

    func testWebAssetsPersistInHistory() throws {
        var host = record(0).hosts[0]
        host.webServices = [WebService(url: "https://192.168.1.1:8443/", statusCode: 401,
                                       title: "管理中心", server: "nginx", redirectURL: nil)]
        let restored = try JSONDecoder().decode(HostResult.self, from: JSONEncoder().encode(host))
        XCTAssertEqual(restored.webServices?.first?.url, "https://192.168.1.1:8443/")
        XCTAssertEqual(restored.webServices?.first?.statusCode, 401)
        XCTAssertEqual(restored.webServices?.first?.title, "管理中心")
        XCTAssertEqual(restored.webServices?.first?.server, "nginx")
        host.webServices = []
        let empty = try JSONDecoder().decode(HostResult.self, from: JSONEncoder().encode(host))
        XCTAssertEqual(empty.webServices?.count, 0)
    }

    func testWebMetadataAndLegacyService() throws {
        let url = "http://192.168.41.1:8080/"
        let data = Data("HTTP/1.1 302 Found\r\nsErVeR: nginx\r\nLocation: /login\r\nContent-Type: text/html; charset=utf-8\r\n\r\n<TITLE> 管理中心 &amp; NAS &#x41; &#66;\n 登录 </TITLE>".utf8)
        let service = try XCTUnwrap(WebService.response(in: data, url: url))
        XCTAssertEqual(service.title, "管理中心 & NAS A B 登录")
        XCTAssertEqual(service.server, "nginx")
        XCTAssertEqual(service.redirectURL, "http://192.168.41.1:8080/login")
        let restored = try JSONDecoder().decode(WebService.self, from: JSONEncoder().encode(service))
        XCTAssertEqual(restored.redirectURL, service.redirectURL)
        let legacy = try JSONDecoder().decode(WebService.self, from: Data("{\"url\":\"http://192.168.41.1/\",\"statusCode\":200}".utf8))
        XCTAssertNil(legacy.title)
        XCTAssertNil(legacy.server)
        XCTAssertNil(legacy.redirectURL)
        XCTAssertNil(legacy.certificateTrusted)
    }

    func testHTTPSCertificateStatusRoundTrip() throws {
        for trusted in [true, false] {
            let service = WebService(url: "https://172.18.120.84:443/", statusCode: 200,
                                     certificateTrusted: trusted)
            let restored = try JSONDecoder().decode(WebService.self, from: JSONEncoder().encode(service))
            XCTAssertEqual(restored.certificateTrusted, trusted)
            XCTAssertEqual(restored.url, service.url)
        }
        let http = WebService.response(in: Data("HTTP/1.1 400 Bad Request\r\n\r\n".utf8),
                                       url: "http://172.18.120.84:443/")
        XCTAssertEqual(http?.statusCode, 400)
        XCTAssertNil(http?.certificateTrusted)
    }

    func testExplicitHTTPToHTTPSMismatch() throws {
        let page = "HTTP/1.1 400 Bad Request\r\nContent-Type: text/html\r\n\r\n<html><head><title>400 The plain HTTP request was sent to HTTPS port</title></head><body>The plain HTTP request was sent to HTTPS port</body></html>"
        for port in [443, 8443] {
            let service = try XCTUnwrap(WebService.response(in: Data(page.utf8), url: "http://172.18.120.84:\(port)/"))
            XCTAssertTrue(service.isHTTPToHTTPSMismatch)
        }
        let https = try XCTUnwrap(WebService.response(in: Data(page.utf8), url: "https://172.18.120.84:443/"))
        XCTAssertFalse(https.isHTTPToHTTPSMismatch)
        for code in [200, 401, 403, 404] {
            let service = WebService(url: "http://172.18.120.84:443/", statusCode: code,
                                     title: "400 The plain HTTP request was sent to HTTPS port")
            XCTAssertFalse(service.isHTTPToHTTPSMismatch)
        }
        let titles: [String?] = [nil, "400 Bad Request", "Invalid request", "Help: The plain HTTP request was sent to HTTPS port"]
        for title in titles {
            let service = WebService(url: "http://172.18.120.84:443/", statusCode: 400, title: title)
            XCTAssertFalse(service.isHTTPToHTTPSMismatch)
        }
        // HEAD has no page evidence. Do not drop it if the later GET fails.
        let head = try XCTUnwrap(WebService.response(in: Data("HTTP/1.1 400 Bad Request\r\n\r\n".utf8),
                                                   url: "http://172.18.120.84:443/"))
        XCTAssertFalse(head.isHTTPToHTTPSMismatch)
    }

    func testChunkedAndIncompletePages() throws {
        let url = "http://192.168.41.1/"
        let chunks = ["<html><ti", "tle>设备", " &amp; NAS</title></html>"]
        var response = "HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n"
        for chunk in chunks {
            response += "\(String(chunk.utf8.count, radix: 16));extension=value\r\n\(chunk)\r\n"
        }
        response += "0\r\n\r\n"
        XCTAssertEqual(WebService.response(in: Data(response.utf8), url: url)?.title, "设备 & NAS")
        let incomplete = Data("HTTP/1.1 200 OK\r\nServer: nginx\r\n\r\n<title>unfinished".utf8)
        let service = try XCTUnwrap(WebService.response(in: incomplete, url: url))
        XCTAssertNil(service.title)
        XCTAssertEqual(service.server, "nginx")
        XCTAssertEqual(WebService.response(in: Data("HTTP/1.1 403 Forbidden\r\n".utf8), url: url)?.statusCode, 403)
        XCTAssertNil(WebService.response(in: Data("SSH-2.0-test\r\n".utf8), url: url))
    }

    func testNonHTMLAndUnsafeRedirectDoNotProducePageMetadata() {
        let url = "http://192.168.41.1/"
        for extra in ["Content-Type: application/json", "Content-Encoding: gzip"] {
            let response = "HTTP/1.1 200 OK\r\nServer: test\r\n\(extra)\r\n\r\n<title>Not HTML</title>"
            let service = WebService.response(in: Data(response.utf8), url: url)
            XCTAssertNil(service?.title)
            XCTAssertEqual(service?.server, "test")
        }
        let redirect = Data("HTTP/1.1 302 Found\r\nLocation: javascript:alert(1)\r\n\r\n".utf8)
        XCTAssertNil(WebService.response(in: redirect, url: url)?.redirectURL)
    }

    func testOnlyBrowsablePagesAreMarkedAsWebPages() throws {
        let url = "http://192.168.31.76:5000/"
        func page(_ response: String) throws -> Bool? {
            try XCTUnwrap(WebService.response(in: Data(response.utf8), url: url)).isPage
        }
        XCTAssertEqual(try page("HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n"), true)
        XCTAssertEqual(try page("HTTP/1.1 200 OK\r\n\r\n<!DOCTYPE html><body>hi</body>"), true)
        XCTAssertEqual(try page("HTTP/1.1 302 Found\r\nLocation: /login\r\n\r\n"), true)
        XCTAssertEqual(try page("HTTP/1.1 401 Unauthorized\r\nWWW-Authenticate: Basic realm=\"x\"\r\n\r\n"), true)
        XCTAssertEqual(try page("HTTP/1.1 404 Not Found\r\nContent-Type: text/html\r\n\r\n<title>Not Found</title>"), true)
        XCTAssertEqual(try page("HTTP/1.1 403 Forbidden\r\nServer: AirTunes/870.14.1\r\nContent-Length: 0\r\n\r\n"), false)
        XCTAssertEqual(try page("HTTP/1.1 200 OK\r\nServer: AirTunes/870.14.1\r\nContent-Type: text/html\r\n\r\n<title>x</title>"), false)
        XCTAssertEqual(try page("HTTP/1.1 404 Not Found\r\nContent-Type: application/json\r\n\r\n{}"), false)
        XCTAssertEqual(try page("HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}"), false)
        XCTAssertEqual(try page("HTTP/1.1 401 Unauthorized\r\n\r\n"), false)
        XCTAssertEqual(try page("HTTP/1.1 403 Forbidden\r\n\r\n"), false)
        let legacy = try JSONDecoder().decode(WebService.self, from: Data("{\"url\":\"http://192.168.41.1/\",\"statusCode\":403}".utf8))
        XCTAssertNil(legacy.isPage)
    }

    func testPersistenceRetentionAndDeletion() throws {
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        defer { try? FileManager.default.removeItem(at: directory) }
        let store = ScanHistoryStore(fileURL: directory.appendingPathComponent("history.json"))
        XCTAssertTrue(try store.load().isEmpty)
        let records = (0..<35).map { record($0, wifiName: "办公室") }
        try store.save(records)
        let restored = try ScanHistoryStore(fileURL: store.fileURL).load()
        XCTAssertEqual(restored.count, 30)
        XCTAssertEqual(restored.first?.id, records.last?.id)
        XCTAssertEqual(restored.last?.id, records[5].id)
        XCTAssertEqual(restored.first?.wifiName, "办公室")
        XCTAssertEqual(restored.first?.outcome, .stopped)
        XCTAssertEqual(restored.first?.completed, 10)
        XCTAssertEqual(restored.first?.hosts.first?.open, false)
        XCTAssertEqual(restored.first?.hosts.first?.milliseconds, 12)
        try store.save(Array(restored.dropFirst()))
        XCTAssertEqual(try store.load().count, 29)
        try store.save([])
        XCTAssertTrue(try store.load().isEmpty)
    }

    func testMissingWiFiMetadataAndCorruptFile() throws {
        let original = record(1)
        let decoded = try JSONDecoder().decode(ScanRecord.self, from: JSONEncoder().encode(original))
        XCTAssertNil(decoded.wifiName)
        XCTAssertEqual(decoded.id, original.id)
        let file = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        defer { try? FileManager.default.removeItem(at: file) }
        try Data("invalid json".utf8).write(to: file)
        XCTAssertThrowsError(try ScanHistoryStore(fileURL: file).load())
    }
}
