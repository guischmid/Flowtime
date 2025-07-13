Flowtime for macOS

A simple, beautiful menu bar app for macOS based on the Flowtime Technique. This is a small side project mostly for myself  and  built to learn SwiftUI and create a useful productivity tool. It helps you focus by tracking your work sessions and suggesting natural break times, allowing you to stay in the zone without the rigid constraints of a Pomodoro timer.

Screenshots

Breaks Settings
	

General Settings
	

Sound Settings


	


	


What is the Flowtime Technique?

Flowtime is a flexible productivity method. Instead of rigid timers, you work until you feel a natural stopping point and then take a break. This app automates the process, letting you focus on your work, not the clock.
Features

    🍅 State-Aware Menu Bar Icon: The app's icon changes to let you know your current state at a glance.

    📈 Dynamic Timer: The elapsed work time or remaining break time is displayed directly in the menu bar.

    🔧 Customizable Break Rules: Adjust the break calculation rules to fit your personal workflow.

    ⌨️ Global Keyboard Shortcut: Start or stop the timer from anywhere in macOS.

    🚀 Launch at Login: Automatically start Flowtime when you log in to your Mac.

    🔔 Sound Notifications: Optional audio cues for session start and break end.

Building from Source

To build this project yourself:

    Clone the repository:

    git clone https://github.com/guischmid/Flowtime.git

    Open the Flowtime.xcodeproj file in Xcode.

    Xcode will automatically resolve the package dependencies.

    Build and run the project (Cmd+R).

Future Ideas

This project is a work in progress. Here are some potential features and fixes for the future:

    Task Naming: Ability to name or tag your focus sessions.

    Session History: A log or simple chart to review your work patterns.

    UI Polish: Refine animations and spacing for a cleaner look.

    Advanced Notifications: Add more notification options, like a warning before a break ends.

Acknowledgements

The clean UI and core functionality of this app were heavily inspired by the excellent open-source project TomatoBar by Ilya Voronin. A big thank you for the inspiration!
Dependencies

    LaunchAtLogin

    KeyboardShortcuts

License

This project is licensed under the MIT License
