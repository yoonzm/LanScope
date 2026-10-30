import Foundation
import XCTest
@testable import LanScopeCore

final class DeviceIdentityTests: XCTestCase {
    func testHostnameCleaning() {
        XCTAssertEqual(DeviceIdentity.cleanHostname("Yins-iPhone.lan.", ip: "192.168.1.5"), "Yins-iPhone")
        XCTAssertEqual(DeviceIdentity.cleanHostname("DESKTOP-ABC123.local", ip: "192.168.1.6"), "DESKTOP-ABC123")
        XCTAssertNil(DeviceIdentity.cleanHostname("192.168.1.7", ip: "192.168.1.7"))
        XCTAssertNil(DeviceIdentity.cleanHostname("192-168-1-8.lan", ip: "192.168.1.8"))
        XCTAssertNil(DeviceIdentity.cleanHostname("8.1.168.192.in-addr.arpa", ip: "192.168.1.8"))
        XCTAssertNil(DeviceIdentity.cleanHostname("  ", ip: "192.168.1.9"))
    }

    func testMergeKeepsEarlierValuesAndDeduplicates() {
        var identity = DeviceIdentity(hostname: "tv", names: ["客厅电视"], services: ["_airplay._tcp"], model: nil)
        identity.merge(DeviceIdentity(hostname: "other", names: ["客厅电视", "Samsung"],
                                      services: ["_airplay._tcp", "_raop._tcp"], model: "QN90"))
        XCTAssertEqual(identity.hostname, "tv")
        XCTAssertEqual(identity.names, ["客厅电视", "Samsung"])
        XCTAssertEqual(identity.services, ["_airplay._tcp", "_raop._tcp"])
        XCTAssertEqual(identity.model, "QN90")
        XCTAssertEqual(identity.displayName, "客厅电视")
    }

    func testKindFromModelAndServices() {
        XCTAssertEqual(DeviceIdentity(model: "MacBookPro18,3").kind, "Mac 笔记本")
        XCTAssertEqual(DeviceIdentity(model: "Mac14,2").kind, "Mac")
        XCTAssertEqual(DeviceIdentity(model: "AppleTV6,2").kind, "Apple TV")
        XCTAssertEqual(DeviceIdentity(services: ["_googlecast._tcp"]).kind, "Chromecast / Google TV")
        XCTAssertEqual(DeviceIdentity(services: ["_airplay._tcp", "_smb._tcp"]).kind, "电脑 / NAS")
        XCTAssertEqual(DeviceIdentity(services: ["_ipp._tcp", "_http._tcp"]).kind, "打印机")
        XCTAssertNil(DeviceIdentity(services: ["_http._tcp"]).kind)
        XCTAssertTrue(DeviceIdentity().isEmpty)
    }

    func testTXTHintsAndSummary() {
        let hints = DeviceIdentity.fromTXT(["fn": "客厅电视", "md": "Chromecast"])
        XCTAssertEqual(hints.name, "客厅电视")
        XCTAssertEqual(hints.model, "Chromecast")
        XCTAssertEqual(DeviceIdentity.fromTXT(["model": "iPhone15,2"]).model, "iPhone15,2")
        XCTAssertNil(DeviceIdentity.fromTXT([:]).name)
        let identity = DeviceIdentity(hostname: "Yins-Mac", names: ["Yin 的 Mac"], model: "Mac14,2")
        XCTAssertEqual(identity.summary, "Mac · Mac14,2 · Yins-Mac")
    }

    func testLegacyHostHasNoIdentityAndIdentityRoundTrips() throws {
        let legacy = Data("{\"ip\":\"192.168.1.1\",\"port\":80,\"open\":false,\"milliseconds\":12,\"discoveredAt\":0}".utf8)
        XCTAssertNil(try JSONDecoder().decode(HostResult.self, from: legacy).identity)
        var host = HostResult(ip: "192.168.1.2", port: nil, open: nil, milliseconds: 0, discoveredAt: Date())
        host.identity = DeviceIdentity(hostname: "tv", names: ["电视"], services: ["_airplay._tcp"], model: "m")
        let restored = try JSONDecoder().decode(HostResult.self, from: JSONEncoder().encode(host))
        XCTAssertEqual(restored.identity, host.identity)
    }
}
