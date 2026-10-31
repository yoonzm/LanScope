import Foundation
import XCTest
@testable import LanScopeCore

// Guards the hand-maintained string catalogs: every key needs an English translation whose
// placeholders match the key, otherwise String(format:) can crash or show the wrong value.
final class LocalizationCatalogTests: XCTestCase {
    private func catalog(_ name: String) throws -> [String: Any] {
        let url = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
            .deletingLastPathComponent().appendingPathComponent("LanScope/\(name)")
        let json = try JSONSerialization.jsonObject(with: Data(contentsOf: url)) as? [String: Any]
        XCTAssertEqual(json?["sourceLanguage"] as? String, "zh-Hans")
        return try XCTUnwrap(json?["strings"] as? [String: Any])
    }

    // Placeholder types in order, ignoring positional indices ("%1$@" counts as "@").
    private func placeholders(_ text: String) -> [String] {
        let regex = try! NSRegularExpression(pattern: "%(?:\\d+\\$)?(lld|@|%)")
        return regex.matches(in: text, range: NSRange(text.startIndex..., in: text)).compactMap {
            let type = String(text[Range($0.range(at: 1), in: text)!])
            return type == "%" ? nil : type
        }
    }

    private func englishValues(_ entry: Any) -> [String] {
        guard let localizations = (entry as? [String: Any])?["localizations"] as? [String: Any],
              let english = localizations["en"] as? [String: Any] else { return [] }
        if let value = (english["stringUnit"] as? [String: Any])?["value"] as? String { return [value] }
        let plural = (english["variations"] as? [String: Any])?["plural"] as? [String: Any] ?? [:]
        return plural.values.compactMap { (($0 as? [String: Any])?["stringUnit"] as? [String: Any])?["value"] as? String }
    }

    func testEveryKeyHasMatchingEnglishTranslation() throws {
        let strings = try catalog("Localizable.xcstrings")
        XCTAssertFalse(strings.isEmpty)
        for (key, entry) in strings {
            let values = englishValues(entry)
            XCTAssertFalse(values.isEmpty, "Missing English for \(key)")
            for value in values {
                XCTAssertEqual(placeholders(value).sorted(), placeholders(key).sorted(), "Placeholder mismatch for \(key)")
            }
        }
    }

    // The in-app language switch loads zh-Hans.lproj directly, so the source language must be compiled too.
    func testEveryKeyHasSimplifiedChineseValue() throws {
        for (key, entry) in try catalog("Localizable.xcstrings") {
            let localizations = (entry as? [String: Any])?["localizations"] as? [String: Any]
            let unit = (localizations?["zh-Hans"] as? [String: Any])?["stringUnit"] as? [String: Any]
            XCTAssertEqual(unit?["value"] as? String, key, "Missing zh-Hans for \(key)")
        }
    }

    func testLookupFallsBackToKey() {
        XCTAssertEqual(AppLocalization.string("开放"), "开放")
    }

    func testPrivacyDescriptionsAreTranslated() throws {
        let strings = try catalog("InfoPlist.xcstrings")
        for key in ["NSLocalNetworkUsageDescription", "NSLocationWhenInUseUsageDescription"] {
            XCTAssertFalse(englishValues(try XCTUnwrap(strings[key])).isEmpty, key)
        }
    }
}
