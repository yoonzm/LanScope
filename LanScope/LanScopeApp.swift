import SwiftUI

@main
struct LanScopeApp: App {
    init() { AppLanguage.restore() }

    var body: some Scene {
        WindowGroup { ContentView() }
    }
}
