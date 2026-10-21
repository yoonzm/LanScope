import Foundation

struct ICMPPacket {
    let identifier: UInt16
    let payload: [UInt8]

    var request: [UInt8] {
        var bytes: [UInt8] = [8, 0, 0, 0, UInt8(identifier >> 8), UInt8(identifier & 255), 0, 1] + payload
        let sum = Self.checksum(bytes)
        bytes[2] = UInt8(sum >> 8)
        bytes[3] = UInt8(sum & 255)
        return bytes
    }

    func matchesReply(_ packet: [UInt8]) -> Bool {
        var offset = 0
        if let first = packet.first, first >> 4 == 4 {
            offset = Int(first & 15) * 4
            guard offset >= 20, packet.count >= offset + 8, packet[9] == 1 else { return false }
        }
        guard packet.count == offset + 8 + payload.count else { return false }
        let bytes = Array(packet.dropFirst(offset))
        return bytes[0] == 0 && bytes[1] == 0 &&
            bytes[4] == UInt8(identifier >> 8) && bytes[5] == UInt8(identifier & 255) &&
            bytes[6] == 0 && bytes[7] == 1 &&
            Array(bytes.dropFirst(8)) == payload && Self.checksum(bytes) == 0
    }

    static func checksum(_ bytes: [UInt8]) -> UInt16 {
        var sum: UInt32 = 0
        for index in stride(from: 0, to: bytes.count, by: 2) {
            sum += UInt32(bytes[index]) << 8
            if index + 1 < bytes.count { sum += UInt32(bytes[index + 1]) }
        }
        while sum >> 16 != 0 { sum = (sum & 0xffff) + (sum >> 16) }
        return ~UInt16(sum)
    }
}
