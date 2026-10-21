import Foundation
import XCTest
@testable import LanScopeCore

final class ScanHistoryTests: XCTestCase {
    private func record(_ index: Int, wifiName: String? = nil) -> ScanRecord {
        ScanRecord(id: UUID(), startedAt: Date(timeIntervalSince1970: Double(index)),
                   endedAt: Date(timeIntervalSince1970: Double(index + 1)),
                   cidr: "192.168.1.0/24", wifiName: wifiName, outcome: .stopped,
                   completed: 10, total: 254,
                   hosts: [HostResult(ip: "192.168.1.1", port: 80, open: false,
                                      milliseconds: 12, discoveredAt: Date(timeIntervalSince1970: 1))],
                   diagnostic: nil)
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
