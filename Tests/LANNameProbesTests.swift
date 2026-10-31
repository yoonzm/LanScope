import XCTest
@testable import LanScopeCore

final class LANNameProbesTests: XCTestCase {
    func testNodeStatusQueryEncodesWildcardName() {
        let packet = NetBIOS.nodeStatusQuery(id: 0x1234)
        XCTAssertEqual(packet.count, 50)
        XCTAssertEqual(Array(packet[0..<6]), [0x12, 0x34, 0, 0, 0, 1])
        XCTAssertEqual(packet[12], 32)
        // "*" (0x2A) encodes as "CK", padding bytes as "AA".
        XCTAssertEqual(String(bytes: packet[13..<17], encoding: .ascii), "CKAA")
        XCTAssertEqual(Array(packet[45...]), [0, 0x00, 0x21, 0x00, 0x01])
    }

    private func nodeStatusResponse(id: UInt16, names: [(String, UInt8, Bool)]) -> [UInt8] {
        var data: [UInt8] = [UInt8(id >> 8), UInt8(id & 0xFF), 0x84, 0x00, 0, 0, 0, 1, 0, 0, 0, 0]
        data += Array(NetBIOS.nodeStatusQuery(id: id)[12..<46])
        data += [0x00, 0x21, 0x00, 0x01, 0, 0, 0, 0]
        let rdLength = 1 + names.count * 18 + 46
        data += [UInt8(rdLength >> 8), UInt8(rdLength & 0xFF), UInt8(names.count)]
        for (name, suffix, group) in names {
            var bytes = Array(name.utf8.prefix(15))
            bytes += [UInt8](repeating: 0x20, count: 15 - bytes.count)
            data += bytes + [suffix, group ? 0x84 : 0x04, 0x00]
        }
        return data + [UInt8](repeating: 0, count: 46)
    }

    func testNodeStatusPicksUniqueWorkstationName() {
        let response = nodeStatusResponse(id: 7, names: [
            ("WORKGROUP", 0x00, true), ("DESKTOP-AB12", 0x20, false), ("DESKTOP-AB12", 0x00, false)
        ])
        XCTAssertEqual(NetBIOS.computerName(fromNodeStatus: response, id: 7), "DESKTOP-AB12")
        XCTAssertNil(NetBIOS.computerName(fromNodeStatus: response, id: 8))
        XCTAssertNil(NetBIOS.computerName(fromNodeStatus: Array(response.prefix(40)), id: 7))
    }

    func testNetBIOSIdentityIsComputerOrNAS() {
        let identity = NetBIOS.identity(computerName: "NAS-HOME", ip: "192.168.1.5")
        XCTAssertEqual(identity?.hostname, "NAS-HOME")
        XCTAssertEqual(identity?.kind, "电脑 / NAS")
    }

    func testSSDPLocationMustBeHTTPOnSameHost() {
        let response = "HTTP/1.1 200 OK\r\nCACHE-CONTROL: max-age=1800\r\nlocation: http://192.168.1.20:49152/desc.xml\r\nST: upnp:rootdevice\r\n\r\n"
        XCTAssertEqual(SSDP.location(fromResponse: Array(response.utf8), ip: "192.168.1.20")?.absoluteString,
                       "http://192.168.1.20:49152/desc.xml")
        XCTAssertNil(SSDP.location(fromResponse: Array(response.utf8), ip: "192.168.1.21"))
        let https = response.replacingOccurrences(of: "http://", with: "https://")
        XCTAssertNil(SSDP.location(fromResponse: Array(https.utf8), ip: "192.168.1.20"))
        XCTAssertTrue(String(decoding: SSDP.searchRequest(ip: "10.0.0.2"), as: UTF8.self).hasPrefix("M-SEARCH * HTTP/1.1\r\nHOST: 10.0.0.2:1900\r\n"))
    }

    func testUPnPDescriptionUsesRootDevice() throws {
        let xml = """
        <?xml version="1.0"?>
        <root xmlns="urn:schemas-upnp-org:device-1-0"><specVersion><major>1</major></specVersion>
          <device>
            <deviceType>urn:schemas-upnp-org:device:MediaRenderer:1</deviceType>
            <friendlyName> [TV] Samsung  客厅 </friendlyName>
            <manufacturer>Samsung Electronics</manufacturer>
            <modelName>QN65Q80C</modelName>
            <deviceList><device><friendlyName>Sub</friendlyName><deviceType>urn:x:device:Other:1</deviceType></device></deviceList>
          </device>
        </root>
        """
        let chunk = String(xml.utf8.count, radix: 16)
        let http = "HTTP/1.1 200 OK\r\nContent-Type: text/xml\r\nTransfer-Encoding: chunked\r\n\r\n\(chunk)\r\n\(xml)\r\n0\r\n\r\n"
        let description = try XCTUnwrap(UPnPDescription.parse(httpResponse: Data(http.utf8)))
        XCTAssertEqual(description.friendlyName, "[TV] Samsung 客厅")
        XCTAssertEqual(description.deviceKind, "MediaRenderer")
        let identity = description.identity()
        XCTAssertEqual(identity.names, ["[TV] Samsung 客厅"])
        XCTAssertEqual(identity.kind, "媒体播放器")
        XCTAssertEqual(identity.summary, "媒体播放器 · Samsung Electronics QN65Q80C")
    }

    func testUPnPModelDoesNotRepeatManufacturer() {
        let description = UPnPDescription(friendlyName: nil, manufacturer: "Synology",
                                          modelName: "Synology DS920+", deviceType: "urn:schemas-upnp-org:device:MediaServer:1")
        XCTAssertEqual(description.identity().model, "Synology DS920+")
        XCTAssertEqual(description.identity().kind, "媒体服务器")
        XCTAssertNil(UPnPDescription.parse(httpResponse: Data("HTTP/1.1 404 Not Found\r\n\r\n".utf8)))
    }

    func testBonjourKindWinsOverUPnP() {
        var identity = DeviceIdentity(services: ["upnp:MediaRenderer"])
        identity.merge(DeviceIdentity(services: ["_googlecast._tcp"]))
        XCTAssertEqual(identity.kind, "Chromecast / Google TV")
    }
}
