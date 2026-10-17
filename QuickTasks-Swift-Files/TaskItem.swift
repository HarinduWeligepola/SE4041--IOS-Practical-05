import Foundation

// Part G, Option D - Priority is stored as an enum, so a task can only
// ever hold one of three valid values. The raw value supplies the text
// shown on the detail screen.

enum Priority: String {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

// The task model.
// Identifiable gives each task a stable identity through id, which is
// what List uses to tell the rows apart.

struct TaskItem: Identifiable {

    let id = UUID()

    var title: String
    var completed: Bool
    var priority: Priority
}
