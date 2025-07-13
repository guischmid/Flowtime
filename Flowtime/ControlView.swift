//
//  ControlView.swift
//  Flowtime
//
//  Created by Guilherme on 13.07.25.
//


import SwiftUI

struct ControlView: View {
    @ObservedObject var viewModel: TimerViewModel
    @ObservedObject var settings: AppSettings
    @ObservedObject var soundPlayer: SoundPlayer // This is still needed for other views if you add them

    @State private var selectedTab = 0
    @State private var buttonHovered = false

    var body: some View {
        VStack(spacing: 8) {
            Button {
                viewModel.startStopAction()
            } label: {
                Text(buttonLabel)
                    .font(.system(.body).monospacedDigit())
                    .frame(maxWidth: .infinity)
            }
            .onHover { over in
                buttonHovered = over
            }
            .controlSize(.large)
            .keyboardShortcut(.defaultAction)

            Picker("Tabs", selection: $selectedTab) {
                Text("Breaks").tag(0)
                Text("Settings").tag(1)
                Text("Sounds").tag(2)
            }
            .pickerStyle(.segmented)
            .labelsHidden()

            GroupBox {
                switch selectedTab {
                case 0:
                    BreaksTabView(settings: settings)
                case 1:
                    SettingsTabView(settings: settings)
                default:
                    SoundsTabView(settings: settings)
                }
            }

            Divider()
            
            Button {
                NSApp.activate(ignoringOtherApps: true)
                NSApp.orderFrontStandardAboutPanel()
            } label: {
                Text("About Flowtime")
                Spacer()
                Text("⌘ A").foregroundColor(.secondary)
            }
            .buttonStyle(.plain)
            .keyboardShortcut("a")

            Button {
                NSApplication.shared.terminate(nil)
            } label: {
                Text("Quit Flowtime")
                Spacer()
                Text("⌘ Q").foregroundColor(.secondary)
            }
            .buttonStyle(.plain)
            .keyboardShortcut("q")
        }
        .padding(12)
        .frame(width: 280)
    }
    
    private var buttonLabel: String {
        if viewModel.appState == .idle {
            return "Start"
        }
        
        if buttonHovered {
            return viewModel.appState == .working ? "Stop" : "End Break"
        }
        
        let timeToFormat = viewModel.appState == .working ? viewModel.elapsedTime : viewModel.breakTimeRemaining
        return formattedTime(timeToFormat)
    }

    private func formattedTime(_ interval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: interval) ?? "00:00"
    }
}
