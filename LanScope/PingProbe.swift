import Foundation
import Darwin

// Owned and called exclusively on Scanner's serial queue.
final class PingProbe {
    enum Outcome { case reply(Int), timeout, failure(String) }
    private var source: DispatchSourceRead?
    private var timer: DispatchWorkItem?
    private var completion: ((Outcome) -> Void)?
    private let packet = ICMPPacket(identifier: UInt16.random(in: 1...UInt16.max),
                                    payload: Array(UUID().uuidString.utf8))

    deinit { cancel() }

    func start(ip: String, interface: String, queue: DispatchQueue,
               completion: @escaping (Outcome) -> Void) {
        self.completion = completion
        let fd = socket(AF_INET, SOCK_DGRAM, IPPROTO_ICMP)
        guard fd >= 0 else { fail(errno); return }
        var index = if_nametoindex(interface)
        guard index != 0 else { close(fd); finish(.failure("Wi-Fi 接口不可用，请检查网络后重试。")); return }
        guard setsockopt(fd, IPPROTO_IP, IP_BOUND_IF, &index, socklen_t(MemoryLayout.size(ofValue: index))) == 0,
              fcntl(fd, F_SETFL, O_NONBLOCK) == 0 else {
            let code = errno
            close(fd)
            fail(code)
            return
        }
        var destination = sockaddr_in()
        destination.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        destination.sin_family = sa_family_t(AF_INET)
        guard inet_pton(AF_INET, ip, &destination.sin_addr) == 1 else {
            close(fd)
            finish(.failure("无效的 ping 目标地址。"))
            return
        }
        let expectedAddress = destination.sin_addr.s_addr
        let reader = DispatchSource.makeReadSource(fileDescriptor: fd, queue: queue)
        source = reader
        let started = DispatchTime.now().uptimeNanoseconds
        reader.setCancelHandler { close(fd) }
        reader.setEventHandler { [weak self] in
            guard let self, self.completion != nil else { return }
            // Bound each callback so cancellation and timeouts cannot be starved.
            for _ in 0..<32 {
                var bytes = [UInt8](repeating: 0, count: 2048)
                var sender = sockaddr_in()
                var length = socklen_t(MemoryLayout<sockaddr_in>.size)
                let count = withUnsafeMutablePointer(to: &sender) { pointer in
                    pointer.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                        let address = $0
                        return bytes.withUnsafeMutableBytes { buffer in
                            recvfrom(fd, buffer.baseAddress, buffer.count, 0, address, &length)
                        }
                    }
                }
                if count < 0 {
                    if errno == EAGAIN || errno == EWOULDBLOCK { return }
                    if errno == EINTR { continue }
                    self.fail(errno)
                    return
                }
                guard sender.sin_addr.s_addr == expectedAddress,
                      self.packet.matchesReply(Array(bytes.prefix(count))) else { continue }
                self.finish(.reply(Int((DispatchTime.now().uptimeNanoseconds - started) / 1_000_000)))
                return
            }
        }
        reader.resume()
        let bytes = packet.request
        let sent = withUnsafePointer(to: &destination) { pointer in
            pointer.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                sendto(fd, bytes, bytes.count, 0, $0, socklen_t(MemoryLayout<sockaddr_in>.size))
            }
        }
        guard sent == bytes.count else { fail(errno); return }
        let timeout = DispatchWorkItem { [weak self] in self?.finish(.timeout) }
        timer = timeout
        queue.asyncAfter(deadline: .now() + 1.5, execute: timeout)
    }

    func cancel() {
        completion = nil
        timer?.cancel()
        timer = nil
        source?.cancel()
        source = nil
    }

    private func finish(_ outcome: Outcome) {
        let callback = completion
        cancel()
        callback?(outcome)
    }

    private func fail(_ code: Int32) {
        if code == EHOSTUNREACH || code == ECONNREFUSED || code == ETIMEDOUT {
            finish(.timeout)
            return
        }
        finish(.failure("ICMP 探测失败：\(String(cString: strerror(code)))。请检查 Wi-Fi 和局域网权限，或关闭“只扫描 ping 成功的设备”。"))
    }
}
