# SE4041 - Practical 05: Building a watchOS App with SwiftUI

**Module:** SE4041 - Mobile Application Design and Development
**Programme:** BSc (Hons) in Information Technology - Interactive Media
**Year 04, Semester 01**
**Platform:** watchOS
**Framework:** SwiftUI

## Student Details

| | |
|---|---|
| Name | Harindu Weligepola |
| Student ID | 23257504 |

## Practical Overview

This practical reuses the Swift and SwiftUI knowledge from Practical 04
to build an Apple Watch application. Apple Watch apps are meant for
short, focused interactions, so the interface keeps the important
information available at a glance and each action takes only a tap or
two.

## Opening the Project

Open `QuickTasks.xcodeproj` in Xcode, choose an Apple Watch Simulator
from the toolbar and press **Command + R**.

The project targets watchOS 10.0 and Swift 5. If no watch simulator is
listed, install the watchOS runtime from **Xcode > Settings > Components**
(called **Platforms** in some versions), then add a simulator through
**Window > Devices and Simulators**.

## Original Project Settings

The project was created with **watchOS > App**, **Watch-only App**, using:

```
Product Name: QuickTasks
Interface:    SwiftUI
Language:     Swift
```

A Watch-only app runs independently on Apple Watch and does not need an
iPhone companion. The bundle identifier is
`lk.ac.sliit.QuickTasks.watchkitapp`.

## Source Files

| File | Purpose |
|---|---|
| `QuickTasksApp.swift` | The `@main` app entry point and `WindowGroup` |
| `TaskItem.swift` | The `TaskItem` model, `Identifiable`, and the `Priority` enum |
| `ContentView.swift` | The task list, completion count, toggling and navigation |
| `TaskDetailView.swift` | The detail screen for one task |

## Final Task: Quick Tasks Watch App

The application starts with four tasks held in `@State`:

```
Morning Walk
Drink Water
Read Notes
Call Home
```

The main screen shows the completion count calculated with `filter`, for
example `2 / 4 Completed`, followed by the task list inside a
`NavigationStack`.

Each task has two clearly labelled rows, kept separate so the two
actions never clash:

- a **task row button** that calls `.toggle()` on `completed`, swapping
  the SF Symbol between `circle` and `checkmark.circle.fill`,
- a **Details row** with a `NavigationLink` that opens
  `TaskDetailView`.

The list is indexed with `tasks.indices` so that the task stored in the
array can be changed in place when it is toggled.

The detail screen shows the task title, its status as `Completed` or
`Pending`, and a matching SF Symbol.

### Additional Feature

**Option D - Priority.** `Priority` is an enum with the cases `high`,
`medium` and `low`, each carrying a raw value. The priority is stored on
every task and displayed on the detail screen.

## Testing

| Test | Action | Expected result |
|---|---|---|
| 1 | Launch the app | All four tasks appear |
| 2 | Tap an incomplete task | It becomes completed |
| 3 | Tap the same task again | It returns to incomplete |
| 4 | Complete several tasks | The completion count changes |
| 5 | Open a detail screen, go back, change the status, reopen it | The correct task appears and the status is up to date |
| 6 | Run on at least two Apple Watch Simulator sizes | The layout stays compact and readable |

## Repository Structure

```
SE4041-Practical-05/
├── README.md
├── .gitignore
├── QuickTasks.xcodeproj/
│   ├── project.pbxproj
│   └── xcshareddata/xcschemes/QuickTasks.xcscheme
├── QuickTasks/
│   ├── QuickTasksApp.swift
│   ├── ContentView.swift
│   ├── TaskItem.swift
│   ├── TaskDetailView.swift
│   └── Assets.xcassets/
└── screenshots/
    ├── 01-Main-Screen.png
    ├── 02-Completed-Tasks.png
    └── 03-Task-Detail.png
```

## My Practical Evidence

![Main screen](screenshots/01-Main-Screen.png)
![Completed tasks](screenshots/02-Completed-Tasks.png)
![Task detail](screenshots/03-Task-Detail.png)

Screenshots are captured from the Apple Watch Simulator using
**File > Save Screen**.

## Submission Checklist

- [ ] Project opens successfully in Xcode
- [ ] watchOS target builds without errors
- [ ] App runs in the Apple Watch Simulator
- [ ] At least four tasks displayed
- [ ] Model conforms to `Identifiable`
- [ ] `@State` used
- [ ] `List` used
- [ ] SF Symbols used
- [ ] Task state can be changed
- [ ] Completion count updates correctly
- [ ] `NavigationStack` used
- [ ] Detail screen works
- [ ] One additional feature completed
- [ ] Screenshots added
- [ ] Code committed and pushed to GitHub
