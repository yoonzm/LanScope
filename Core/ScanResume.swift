import Foundation

struct NetworkSnapshot: Equatable {
    let interface: String
    let address: String
    let cidr: String
}

enum ScanResume {
    // A paused scan may continue only on the same Wi-Fi interface, address and subnet.
    // Names are compared only when both sides are known; a missing name never blocks resuming.
    static func canResume(paused: NetworkSnapshot, current: NetworkSnapshot?,
                          pausedWiFi: String?, currentWiFi: String?) -> Bool {
        guard let current, current == paused else { return false }
        if let pausedWiFi, !pausedWiFi.isEmpty, let currentWiFi, !currentWiFi.isEmpty {
            return pausedWiFi == currentWiFi
        }
        return true
    }
}
