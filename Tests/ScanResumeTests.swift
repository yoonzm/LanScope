import XCTest
@testable import LanScopeCore

final class ScanResumeTests: XCTestCase {
    private let home = NetworkSnapshot(interface: "en0", address: "192.168.1.20", cidr: "192.168.1.0/24")

    func testResumesOnlyOnUnchangedNetwork() {
        XCTAssertTrue(ScanResume.canResume(paused: home, current: home, pausedWiFi: "Home", currentWiFi: "Home"))
        XCTAssertFalse(ScanResume.canResume(paused: home, current: nil, pausedWiFi: "Home", currentWiFi: "Home"))
        let otherAddress = NetworkSnapshot(interface: "en0", address: "192.168.1.21", cidr: "192.168.1.0/24")
        XCTAssertFalse(ScanResume.canResume(paused: home, current: otherAddress, pausedWiFi: nil, currentWiFi: nil))
        let otherSubnet = NetworkSnapshot(interface: "en0", address: "10.0.0.5", cidr: "10.0.0.0/24")
        XCTAssertFalse(ScanResume.canResume(paused: home, current: otherSubnet, pausedWiFi: nil, currentWiFi: nil))
    }

    func testWiFiNameComparedOnlyWhenBothKnown() {
        XCTAssertFalse(ScanResume.canResume(paused: home, current: home, pausedWiFi: "Home", currentWiFi: "Cafe"))
        XCTAssertTrue(ScanResume.canResume(paused: home, current: home, pausedWiFi: "Home", currentWiFi: nil))
        XCTAssertTrue(ScanResume.canResume(paused: home, current: home, pausedWiFi: nil, currentWiFi: "Cafe"))
        XCTAssertTrue(ScanResume.canResume(paused: home, current: home, pausedWiFi: "", currentWiFi: "Cafe"))
    }
}
