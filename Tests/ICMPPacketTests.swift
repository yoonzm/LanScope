import XCTest
@testable import LanScopeCore

final class ICMPPacketTests: XCTestCase {
    private let probe = ICMPPacket(identifier: 0x1234, payload: [1, 2, 3])

    private func reply() -> [UInt8] {
        var bytes = probe.request
        bytes[0] = 0
        return checksummed(bytes)
    }

    private func checksummed(_ bytes: [UInt8]) -> [UInt8] {
        var bytes = bytes
        bytes[2] = 0
        bytes[3] = 0
        let checksum = ICMPPacket.checksum(bytes)
        bytes[2] = UInt8(checksum >> 8)
        bytes[3] = UInt8(checksum & 255)
        return bytes
    }

    func testKnownChecksumAndReplyWithIPv4Options() {
        XCTAssertEqual(probe.request, [8, 0, 0xe1, 0xc8, 0x12, 0x34, 0, 1, 1, 2, 3])
        XCTAssertTrue(probe.matchesReply(reply()))
        var header = [UInt8](repeating: 0, count: 24)
        header[0] = 0x46
        header[9] = 1
        XCTAssertTrue(probe.matchesReply(header + reply()))
        header[9] = 17
        XCTAssertFalse(probe.matchesReply(header + reply()))
    }

    func testRejectsOtherSessionsMalformedPacketsAndICMPErrors() {
        XCTAssertFalse(probe.matchesReply(probe.request))
        for index in [0, 1, 4, 5, 6, 7, 8] {
            var bytes = reply()
            bytes[index] ^= 1
            XCTAssertFalse(probe.matchesReply(checksummed(bytes)))
        }
        var corrupt = reply()
        corrupt[2] ^= 1
        XCTAssertFalse(probe.matchesReply(corrupt))
        for count in 0..<reply().count {
            XCTAssertFalse(probe.matchesReply(Array(reply().prefix(count))))
        }
        XCTAssertFalse(probe.matchesReply([0x41] + reply()))
    }
}
