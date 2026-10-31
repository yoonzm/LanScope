import Foundation

// In-app language choice, stored the same way as the per-app language in iOS Settings
// (AppleLanguages in the app's own defaults), so both places always agree.
// Switching applies immediately; system-provided text such as permission prompts follows on next launch.
enum AppLanguage: String, CaseIterable, Identifiable {
    case system
    case simplifiedChinese = "zh-Hans"
    case english = "en"

    // Bumped on every change so SwiftUI rebuilds the interface; holds the chosen raw value.
    static let changeKey = "LanScope.language"
    private static let appleLanguages = "AppleLanguages"

    var id: String { rawValue }

    static var saved: AppLanguage {
        let domain = Bundle.main.bundleIdentifier.flatMap { UserDefaults.standard.persistentDomain(forName: $0) }
        guard let first = (domain?[appleLanguages] as? [String])?.first else { return .system }
        if first.hasPrefix("zh") { return .simplifiedChinese }
        if first.hasPrefix("en") { return .english }
        return .system
    }

    // Language names are shown in their own language so they stay recognisable after switching.
    var title: String {
        switch self {
        case .system: return tr("跟随系统")
        case .simplifiedChinese: return "简体中文"
        case .english: return "English"
        }
    }

    // The localization actually used: the explicit choice, or the device languages' best match.
    private var resolved: String {
        if self != .system { return rawValue }
        let device = UserDefaults.standard.stringArray(forKey: Self.appleLanguages) ?? Locale.preferredLanguages
        return Bundle.preferredLocalizations(from: Bundle.main.localizations, forPreferences: device).first
            ?? Self.simplifiedChinese.rawValue
    }

    private static func activate(_ language: AppLanguage) {
        let identifier = language.resolved
        // The launch-time match needs no override and keeps the user's region for date formats.
        if identifier == Bundle.main.preferredLocalizations.first {
            AppLocalization.bundle = .main
            AppLocalization.locale = .current
        } else if let path = Bundle.main.path(forResource: identifier, ofType: "lproj"),
                  let bundle = Bundle(path: path) {
            AppLocalization.bundle = bundle
            AppLocalization.locale = Locale(identifier: identifier)
        }
    }

    // Updates lookups before the change key is written, so views rebuilt by it read the new language.
    static func apply(_ language: AppLanguage) {
        let defaults = UserDefaults.standard
        if language == .system { defaults.removeObject(forKey: appleLanguages) }
        else { defaults.set([language.rawValue], forKey: appleLanguages) }
        activate(language)
        defaults.set(language.rawValue, forKey: changeKey)
    }

    // Called at launch before any view reads a string.
    static func restore() {
        activate(saved)
    }
}

// Localized string in the app's current language; use instead of String(localized:).
func tr(_ value: String.LocalizationValue) -> String {
    String(localized: value, bundle: AppLocalization.bundle, locale: AppLocalization.locale)
}

extension Date {
    func appFormatted(date: Date.FormatStyle.DateStyle, time: Date.FormatStyle.TimeStyle) -> String {
        formatted(Date.FormatStyle(date: date, time: time, locale: AppLocalization.locale))
    }
}
