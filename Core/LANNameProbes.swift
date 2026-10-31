import Foundation

// NetBIOS node status (NBSTAT) over UDP 137. Windows PCs and Samba hosts answer a unicast
// query with their registered names, which usually include the computer name.
enum NetBIOS {
    static let port: UInt16 = 137

    // Wildcard "*" name, first-level encoded (RFC 1002 4.1.1), type NBSTAT, class IN.
    static func nodeStatusQuery(id: UInt16) -> [UInt8] {
        var packet: [UInt8] = [UInt8(id >> 8), UInt8(id & 0xFF), 0, 0, 0, 1, 0, 0, 0, 0, 0, 0]
        var name = [UInt8](repeating: 0, count: 16)
        name[0] = UInt8(ascii: "*")
        packet.append(32)
        for byte in name {
            packet.append(UInt8(ascii: "A") + (byte >> 4))
            packet.append(UInt8(ascii: "A") + (byte & 0x0F))
        }
        packet += [0, 0x00, 0x21, 0x00, 0x01]
        return packet
    }

    // The first unique (non-group) name with suffix 0x00 is the workstation name.
    static func computerName(fromNodeStatus data: [UInt8], id: UInt16) -> String? {
        guard data.count >= 12, data[0] == UInt8(id >> 8), data[1] == UInt8(id & 0xFF),
              data[2] & 0x80 != 0, (Int(data[6]) << 8 | Int(data[7])) >= 1 else { return nil }
        var cursor = 12
        // Skip the answer name: labels, or a compression pointer.
        while cursor < data.count {
            let length = Int(data[cursor])
            if length == 0 { cursor += 1; break }
            if length & 0xC0 == 0xC0 { cursor += 2; break }
            cursor += 1 + length
        }
        // type(2) class(2) ttl(4) rdlength(2), then the name count.
        cursor += 10
        guard cursor < data.count else { return nil }
        let count = Int(data[cursor])
        cursor += 1
        for index in 0..<count {
            let start = cursor + index * 18
            guard start + 18 <= data.count else { return nil }
            let suffix = data[start + 15]
            let isGroup = data[start + 16] & 0x80 != 0
            guard suffix == 0x00, !isGroup else { continue }
            let raw = data[start..<(start + 15)]
            guard let name = String(bytes: raw, encoding: .ascii)?
                .trimmingCharacters(in: CharacterSet.whitespaces.union(.controlCharacters)),
                  !name.isEmpty, name.allSatisfy({ $0.isASCII && ($0.isLetter || $0.isNumber || "-_.".contains($0)) })
            else { continue }
            return name
        }
        return nil
    }

    static func identity(computerName: String, ip: String) -> DeviceIdentity? {
        guard let hostname = DeviceIdentity.cleanHostname(computerName, ip: ip) else { return nil }
        return DeviceIdentity(hostname: hostname, services: ["netbios"])
    }
}

// SSDP M-SEARCH sent straight to one host (UPnP 1.1 unicast search), so no multicast
// entitlement is needed. Many devices only answer multicast; those simply stay silent.
enum SSDP {
    static let port: UInt16 = 1900

    static func searchRequest(ip: String) -> [UInt8] {
        Array("M-SEARCH * HTTP/1.1\r\nHOST: \(ip):1900\r\nMAN: \"ssdp:discover\"\r\nST: upnp:rootdevice\r\n\r\n".utf8)
    }

    // Only a plain-HTTP description on the responding address is followed.
    static func location(fromResponse data: [UInt8], ip: String) -> URL? {
        let text = String(decoding: data, as: UTF8.self)
        let lines = text.components(separatedBy: "\r\n")
        guard let status = lines.first, status.hasPrefix("HTTP/1."), status.contains(" 200") else { return nil }
        for line in lines.dropFirst() {
            guard let colon = line.firstIndex(of: ":"),
                  line[..<colon].trimmingCharacters(in: .whitespaces).lowercased() == "location" else { continue }
            let value = line[line.index(after: colon)...].trimmingCharacters(in: .whitespaces)
            guard let url = URL(string: value), url.scheme?.lowercased() == "http", url.host == ip else { return nil }
            return url
        }
        return nil
    }
}

// The root device fields of a UPnP device description document.
struct UPnPDescription: Equatable {
    var friendlyName: String?
    var manufacturer: String?
    var modelName: String?
    var deviceType: String?

    // Accepts a raw HTTP response; non-200, compressed or non-XML bodies are ignored.
    static func parse(httpResponse data: Data) -> UPnPDescription? {
        guard WebService.statusCode(in: data) == 200,
              let separator = data.range(of: Data("\r\n\r\n".utf8)) else { return nil }
        let header = String(decoding: data[..<separator.lowerBound], as: UTF8.self).lowercased()
        var body = Data(data[separator.upperBound...])
        if header.contains("content-encoding:"), !header.contains("content-encoding: identity") { return nil }
        if header.contains("transfer-encoding: chunked") { body = WebService.unchunk(body) }
        return parse(xml: body)
    }

    static func parse(xml: Data) -> UPnPDescription? {
        let collector = Collector()
        let parser = XMLParser(data: xml)
        parser.shouldResolveExternalEntities = false
        parser.delegate = collector
        _ = parser.parse()
        let result = collector.result
        return result == UPnPDescription() ? nil : result
    }

    // "urn:schemas-upnp-org:device:MediaRenderer:1" -> "MediaRenderer"
    var deviceKind: String? {
        guard let deviceType else { return nil }
        let parts = deviceType.split(separator: ":")
        return parts.count >= 4 ? String(parts[3]) : nil
    }

    func identity() -> DeviceIdentity {
        var identity = DeviceIdentity()
        if let friendlyName { identity.names = [friendlyName] }
        if let deviceKind { identity.services = ["upnp:" + deviceKind] }
        switch (manufacturer, modelName) {
        case let (maker?, model?):
            // Skip the maker when the model already carries it ("Synology DS920+").
            identity.model = model.lowercased().hasPrefix(maker.lowercased()) ? model : maker + " " + model
        case let (maker?, nil): identity.model = maker
        case let (nil, model?): identity.model = model
        default: break
        }
        return identity
    }

    // Keeps the first value of each field, which belongs to the root device.
    private final class Collector: NSObject, XMLParserDelegate {
        var result = UPnPDescription()
        private var element: String?
        private var text = ""

        func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?,
                    qualifiedName qName: String?, attributes attributeDict: [String: String] = [:]) {
            element = elementName.split(separator: ":").last.map(String.init)
            text = ""
        }

        func parser(_ parser: XMLParser, foundCharacters string: String) {
            if element != nil, text.count < 256 { text += string }
        }

        func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?,
                    qualifiedName qName: String?) {
            defer { element = nil }
            let value = text.split(whereSeparator: { $0.isWhitespace }).joined(separator: " ")
            guard !value.isEmpty else { return }
            let clipped = String(value.prefix(64))
            switch element {
            case "friendlyName" where result.friendlyName == nil: result.friendlyName = clipped
            case "manufacturer" where result.manufacturer == nil: result.manufacturer = clipped
            case "modelName" where result.modelName == nil: result.modelName = clipped
            case "deviceType" where result.deviceType == nil: result.deviceType = String(value.prefix(128))
            default: break
            }
        }
    }
}
