import Foundation

// Where user-facing strings are looked up. The app points this at the language chosen in
// settings; the default (and the unit tests) use the main bundle and the system language.
enum AppLocalization {
    static var bundle: Bundle = .main
    static var locale: Locale = .current

    static func string(_ key: String) -> String {
        bundle.localizedString(forKey: key, value: key, table: nil)
    }
}
