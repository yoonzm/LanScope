import Foundation
import XCTest
@testable import LanScopeCore

final class ProbeSchedulerTests: XCTestCase {
    func testGlobalLimitAndOutOfOrderCompletion() {
        let scheduler = ProbeScheduler()
        var running: [Int: UUID] = [:]
        var started: [Int] = []
        for index in 0..<100 {
            scheduler.submit { id in
                running[index] = id
                started.append(index)
            }
        }
        XCTAssertEqual(started, Array(0..<64))
        for index in (0..<64).reversed() {
            let id = running.removeValue(forKey: index)!
            scheduler.finish(id)
            XCTAssertLessThanOrEqual(running.count, 64)
            let count = started.count
            scheduler.finish(id) // A timeout racing a network callback cannot free two slots.
            XCTAssertEqual(started.count, count)
        }
        XCTAssertEqual(started, Array(0..<100))
        XCTAssertEqual(running.count, 36)
    }

    func testCancelDiscardsQueuedWorkAndIgnoresOldCompletions() {
        let scheduler = ProbeScheduler(limit: 1)
        var oldID: UUID!
        var currentID: UUID!
        scheduler.submit { oldID = $0 }
        scheduler.submit { _ in XCTFail("Cancelled queued job started") }
        scheduler.cancel()
        scheduler.submit { currentID = $0 }
        var nextStarted = false
        scheduler.submit { _ in nextStarted = true }
        scheduler.finish(oldID)
        XCTAssertFalse(nextStarted)
        scheduler.finish(currentID)
        XCTAssertTrue(nextStarted)
    }

    func testSynchronousCompletionAndNestedSubmission() {
        let scheduler = ProbeScheduler(limit: 1)
        var order: [Int] = []
        scheduler.submit { first in
            order.append(1)
            scheduler.submit { second in
                order.append(2)
                scheduler.finish(second)
            }
            scheduler.finish(first)
        }
        XCTAssertEqual(order, [1, 2])
        scheduler.submit { id in
            order.append(3)
            scheduler.finish(id)
        }
        XCTAssertEqual(order, [1, 2, 3])
    }
}
