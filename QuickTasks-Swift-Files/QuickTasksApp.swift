import SwiftUI

// A Watch-only app runs independently on Apple Watch and does not need
// an accompanying iPhone application.
// @main marks the starting point, WindowGroup holds the first view and
// ContentView is the interface shown when the app launches.

@main
struct QuickTasksApp: App {

    var body: some Scene {

        WindowGroup {
            ContentView()
        }
    }
}
