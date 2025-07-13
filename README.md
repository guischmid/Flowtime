
# Flowtime for macOS

A simple, beautiful menu bar app for macOS based on the Flowtime Technique. This is a small side project built to learn SwiftUI and create a useful productivity tool. It helps you focus by tracking your work sessions and suggesting natural break times, allowing you to stay in the zone without the rigid constraints of a Pomodoro timer.

[**Download the Latest Release**](https://github.com/guischmid/Flowtime/releases/latest)


## Screenshots
### Break Settings
<img width="326" height="458" alt="Screenshot 2025-07-13 at 14 13 27" src="https://github.com/user-attachments/assets/539a4d39-3d1c-44ef-af32-e4eeccb58136" />

### General Settings
<img width="326" height="399" alt="Screenshot 2025-07-13 at 14 13 32" src="https://github.com/user-attachments/assets/cc415787-4cf7-4708-aa9f-2775a6f63b4a" />

### Sound Settings
<img width="326" height="332" alt="Screenshot 2025-07-13 at 14 13 34" src="https://github.com/user-attachments/assets/41145fb2-baf3-43d2-8d3e-210ba4c07e1a" />



---

## What is the Flowtime Technique?

Flowtime is a flexible productivity method. Instead of rigid timers, you work until you feel a natural stopping point and then take a break. This app automates the process, letting you focus on your work, not the clock.

## Features

* **🍅 State-Aware Menu Bar Icon:** The app's icon changes to let you know your current state at a glance.
* **📈 Dynamic Timer:** The elapsed work time or remaining break time is displayed directly in the menu bar.
* **🔧 Customizable Break Rules:** Adjust the break calculation rules to fit your personal workflow.
* **⌨️ Global Keyboard Shortcut:** Start or stop the timer from anywhere in macOS.
* **🚀 Launch at Login:** Automatically start Flowtime when you log in to your Mac.
* **🔔 Sound Notifications:** Optional audio cues for session start and break end.

## Building from Source

To build this project yourself:

1.  Clone the repository:
    ```bash
    git clone [https://github.com/guischmid/Flowtime.git](https://github.com/guischmid/Flowtime.git)
    ```
2.  Open the `Flowtime.xcodeproj` file in Xcode.
3.  Xcode will automatically resolve the package dependencies.
4.  Build and run the project (Cmd+R).

## Future Ideas

This project is a work in progress. Here are some potential features and fixes for the future:

* **Task Naming:** Ability to name or tag your focus sessions.
* **Session History:** A log or simple chart to review your work patterns.
* **UI Polish:** Refine animations and spacing for a cleaner look.
* **Advanced Notifications:** Add more notification options, like a warning before a break ends.

## Acknowledgements

The clean UI and core functionality of this app were heavily inspired by the excellent open-source project **[TomatoBar](https://github.com/ivoronin/TomatoBar)** by Ilya Voronin. A big thank you for the inspiration!

## Dependencies

* [LaunchAtLogin](https://github.com/sindresorhus/LaunchAtLogin)
* [KeyboardShortcuts](https://github.com/sindresorhus/KeyboardShortcuts)

## License

This project is licensed under the MIT License.
