import XCTest
@testable import LanScopeCore

final class IPv4RangeTests: XCTestCase {
    func testSubnetUsesActualMask() {
        XCTAssertEqual(IPv4Range.subnetCIDR(address: "192.168.3.37", netmask: "255.255.254.0"), "192.168.2.0/23")
        XCTAssertEqual(IPv4Range.subnetCIDR(address: "10.2.3.4", netmask: "255.255.0.0"), "10.2.0.0/16")
        XCTAssertEqual(IPv4Range.subnetCIDR(address: "10.0.0.9", netmask: "255.255.255.254"), "10.0.0.8/31")
        XCTAssertEqual(IPv4Range.subnetCIDR(address: "10.0.0.9", netmask: "255.255.255.255"), "10.0.0.9/32")
        XCTAssertEqual(IPv4Range.subnetCIDR(address: "10.0.0.9", netmask: "0.0.0.0"), "0.0.0.0/0")
        XCTAssertNil(IPv4Range.subnetCIDR(address: "10.0.0.9", netmask: "255.0.255.0"))
        XCTAssertNil(IPv4Range.subnetCIDR(address: "invalid", netmask: "255.255.255.0"))
        XCTAssertNil(IPv4Range.subnetCIDR(address: "10.0.0.9", netmask: "255.255.255.256"))
    }

    func testNormalizesAndExcludesNetworkAndBroadcast() throws {
        let range = try IPv4Range("192.168.1.37/24")
        XCTAssertEqual(range.canonicalCIDR, "192.168.1.0/24")
        XCTAssertEqual(range.addresses.count, 254)
        XCTAssertEqual(range.addresses.first, "192.168.1.1")
        XCTAssertEqual(range.addresses.last, "192.168.1.254")
    }

    func testHostAndPointToPointRanges() throws {
        XCTAssertEqual(try IPv4Range("10.0.0.9/32").addresses, ["10.0.0.9"])
        XCTAssertEqual(try IPv4Range("10.0.0.9/31").addresses, ["10.0.0.8", "10.0.0.9"])
        XCTAssertEqual(try IPv4Range("172.16.0.0/22").addresses.count, 1022)
        XCTAssertNoThrow(try IPv4Range("169.254.1.0/24"))
    }

    func testRejectsInvalidOversizedAndPublicRanges() {
        for input in ["", "1.2.3/24", "192.168.1.256/24", "192.168.1.0/33",
                      "192.168.1.0/-1", "192.168.1.0/24/", "10.0.0.0/8",
                      "8.8.8.8/32", "172.32.0.0/24", "127.0.0.1/32"] {
            XCTAssertThrowsError(try IPv4Range(input), input)
        }
    }
}
