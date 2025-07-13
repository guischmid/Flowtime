//
//  SettingsTabView.swift
//  Flowtime
//
//  Created by Guilherme on 13.07.25.
//

import SwiftUI
import LaunchAtLogin
import KeyboardShortcuts

struct SettingsTabView: View {
    @ObservedObject var settings: AppSettings

    var body: some View {
        // We use a VStack with spacing for precise control over the layout.
        VStack(alignment: .leading, spacing: 16) {
            
            Toggle(isOn: $settings.showTimerInMenuBar) {
                // The frame modifier ensures the label text is left-aligned.
                Text("Show timer in menu bar")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .toggleStyle(.switch) // Explicitly use the switch style for toggles.
            
            Toggle(isOn: $settings.autoStartNextSession) {
                Text("Automatically start new session after break")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .toggleStyle(.switch)
            
            Toggle(isOn: $settings.launchAtLogin.isEnabled) {
                Text("Launch at login")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .toggleStyle(.switch)

            // The Recorder view lets us provide a custom label view,
            // which we also align to the left.
            KeyboardShortcuts.Recorder(for: .startStopTimer) {
                 Text("Global Start/Stop Shortcut:")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            // A spacer to push all the content to the top of the GroupBox.
            Spacer()
        }
        .padding(8)
    }
}
