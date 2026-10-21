import Foundation
import XCTest
@testable import LanScopeCore

final class ScanSettingsTests: XCTestCase {
    func testPortsValidateAndPreserveUserOrder() throws {
        XCTAssertEqual(try ScanSettings.parsePorts("443，80 443;22\n65535"), [443, 80, 22, 65535])
        XCTAssertEqual(try ScanSettings.parsePorts("1, 8080"), [1, 8080])
        for text in ["", " , ", "0", "65536", "-1", "+80", "http", "80-90", "80,invalid"] {
            XCTAssertThrowsError(try ScanSettings.parsePorts(text), text)
        }
    }

    func testSettingsSurviveNewStoreAndInvalidSaveKeepsPreviousValue() throws {
        let suite = "LanScopeTests.\(UUID().uuidString)"
        let defaults = try XCTUnwrap(UserDefaults(suiteName: suite))
        defer { defaults.removePersistentDomain(forName: suite) }
        let store = ScanSettingsStore(defaults: defaults)
        XCTAssertEqual(store.load(), ScanSettings())
        let settings = ScanSettings(pingOnly: false, ports: [8080, 22])
        try store.save(settings)
        XCTAssertEqual(ScanSettingsStore(defaults: defaults).load(), settings)
        XCTAssertThrowsError(try store.save(ScanSettings(pingOnly: true, ports: [])))
        XCTAssertEqual(store.load(), settings)
        defaults.set(Data("broken".utf8), forKey: "LanScope.scanSettings.v1")
        XCTAssertEqual(store.load(), ScanSettings())
    }
}
