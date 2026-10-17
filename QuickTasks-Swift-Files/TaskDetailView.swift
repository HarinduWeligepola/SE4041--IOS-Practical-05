import SwiftUI

// The detail screen receives one task and displays it. The layout is
// kept short and centred, because an Apple Watch screen is small and is
// usually only looked at for a moment.

struct TaskDetailView: View {

    let task: TaskItem

    var body: some View {

        VStack(spacing: 10) {

            Image(
                systemName:
                    task.completed
                    ? "checkmark.circle.fill"
                    : "circle"
            )
            .font(.largeTitle)
            .foregroundStyle(task.completed ? .green : .gray)

            Text(task.title)
                .font(.headline)
                .multilineTextAlignment(.center)

            Text(
                task.completed
                ? "Completed"
                : "Pending"
            )
            .font(.caption)

            // Part G, Option D - The priority raw value is shown here.

            Text("Priority: \(task.priority.rawValue)")
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    TaskDetailView(
        task: TaskItem(
            title: "Morning Walk",
            completed: true,
            priority: .medium
        )
    )
}
