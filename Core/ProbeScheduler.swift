import Foundation

// Used only on the scanner's serial queue. Waiting jobs have no socket or timeout.
final class ProbeScheduler {
    private let limit: Int
    private var active: Set<UUID> = []
    private var pending: [(UUID, (UUID) -> Void)] = []
    private var draining = false

    init(limit: Int = 64) {
        precondition(limit > 0)
        self.limit = limit
    }

    func submit(_ start: @escaping (UUID) -> Void) {
        pending.append((UUID(), start))
        drain()
    }

    func finish(_ id: UUID) {
        guard active.remove(id) != nil else { return }
        drain()
    }

    func cancel() {
        pending.removeAll()
        active.removeAll()
    }

    private func drain() {
        guard !draining else { return }
        draining = true
        defer { draining = false }
        while active.count < limit, !pending.isEmpty {
            let (id, start) = pending.removeFirst()
            active.insert(id)
            start(id)
        }
    }
}
