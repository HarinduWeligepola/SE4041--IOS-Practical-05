import SwiftUI

struct ContentView: View {

    // Part B - The app starts with four tasks held in @State, so the
    // interface updates by itself whenever one of them changes.
    // @State does not save the tasks between app launches.

    @State private var tasks = [

        TaskItem(
            title: "Morning Walk",
            completed: true,
            priority: .medium
        ),

        TaskItem(
            title: "Drink Water",
            completed: false,
            priority: .high
        ),

        TaskItem(
            title: "Read Notes",
            completed: false,
            priority: .high
        ),

        TaskItem(
            title: "Call Home",
            completed: true,
            priority: .low
        )
    ]

    // Part E - The completion count is worked out with filter.

    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }

    var body: some View {

        NavigationStack {

            List {

                Section {

                    Text("\(completedCount) / \(tasks.count) Completed")
                        .font(.caption)
                }

                // The index is used so that the task stored in the array
                // can be changed in place.

                ForEach(tasks.indices, id: \.self) { index in

                    Section {

                        // Part D - Tapping this row toggles the status.
                        // The button and the navigation link are kept on
                        // separate rows, so the two actions never clash.

                        Button {

                            tasks[index].completed.toggle()

                        } label: {

                            HStack {

                                Image(
                                    systemName:
                                        tasks[index].completed
                                        ? "checkmark.circle.fill"
                                        : "circle"
                                )
                                .foregroundStyle(
                                    tasks[index].completed ? .green : .gray
                                )

                                Text(tasks[index].title)

                                Spacer()
                            }
                        }

                        // Part F - A separate row opens the detail screen.

                        NavigationLink {

                            TaskDetailView(task: tasks[index])

                        } label: {

                            Label("Details", systemImage: "info.circle")
                                .font(.caption)
                        }
                    }
                }
            }
            .navigationTitle("Quick Tasks")
        }
    }
}

#Preview {
    ContentView()
}
