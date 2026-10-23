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
        host.webServices = [WebService(url: "https://192.168.1.1:8443/", statusCode: 401)]
        let restored = try JSONDecoder().decode(HostResult.self, from: JSONEncoder().encode(host))
        XCTAssertEqual(restored.webServices?.first?.url, "https://192.168.1.1:8443/")
        XCTAssertEqual(restored.webServices?.first?.statusCode, 401)
        host.webServices = []
        let empty = try JSONDecoder().decode(HostResult.self, from: JSONEncoder().encode(host))
        XCTAssertEqual(empty.webServices?.count, 0)
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
