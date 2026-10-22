import Foundation
import Network
import Darwin
import CoreLocation
import class NetworkExtension.NEHotspotNetwork

@MainActor
final class WiFiNameReader: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private var authorizationWaiters: [CheckedContinuation<Void, Never>] = []

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func currentName() async -> String? {
        if locationManager.authorizationStatus == .notDetermined {
            await withCheckedContinuation { continuation in
                authorizationWaiters.append(continuation)
                if authorizationWaiters.count == 1 {
                    locationManager.requestWhenInUseAuthorization()
                }
            }
        }
        guard locationManager.authorizationStatus == .authorizedWhenInUse ||
                locationManager.authorizationStatus == .authorizedAlways,
              locationManager.accuracyAuthorization == .fullAccuracy else { return nil }
        return await withCheckedContinuation { continuation in
            NEHotspotNetwork.fetchCurrent { network in
                continuation.resume(returning: network?.ssid)
            }
        }
    }

    nonisolated func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        Task { @MainActor [weak self] in
            guard let self, self.locationManager.authorizationStatus != .notDetermined else { return }
            let waiters = self.authorizationWaiters
            self.authorizationWaiters.removeAll()
            for waiter in waiters { waiter.resume() }
        }
    }
}

struct WiFiNetwork {
    let interface: String
    let address: String
    let cidr: String

    static func current(path: NWPath) -> WiFiNetwork? {
        let names = path.availableInterfaces.filter { $0.type == .wifi }.map(\.name)
        var head: UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&head) == 0, let first = head else { return nil }
        defer { freeifaddrs(first) }
        var candidates: [WiFiNetwork] = []
        var cursor: UnsafeMutablePointer<ifaddrs>? = first
        while let pointer = cursor {
            let entry = pointer.pointee
            cursor = entry.ifa_next
            let name = String(cString: entry.ifa_name)
            guard names.contains(name),
                  entry.ifa_flags & UInt32(IFF_UP) != 0,
                  entry.ifa_flags & UInt32(IFF_RUNNING) != 0,
                  let address = entry.ifa_addr, let mask = entry.ifa_netmask,
                  address.pointee.sa_family == UInt8(AF_INET),
                  mask.pointee.sa_family == UInt8(AF_INET) else { continue }
            let ip = ipv4(address)
            guard ip != "0.0.0.0",
                  let cidr = IPv4Range.subnetCIDR(address: ip, netmask: ipv4(mask)) else { continue }
            candidates.append(WiFiNetwork(interface: name, address: ip, cidr: cidr))
        }
        // Multiple IPv4 assignments are ambiguous; let the user choose manually.
        return candidates.count == 1 ? candidates[0] : nil
    }

    private static func ipv4(_ pointer: UnsafeMutablePointer<sockaddr>) -> String {
        pointer.withMemoryRebound(to: sockaddr_in.self, capacity: 1) {
            IPv4Range.string(UInt32(bigEndian: $0.pointee.sin_addr.s_addr))
        }
    }
}
