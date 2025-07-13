//
//  FlowtimeApp.swift
//  Flowtime
//
//  Created by Gigi on 13.07.25.

import SwiftUI

@main
struct FlowtimeApp: App {
    @StateObject private var viewModel = TimerViewModel()
    @StateObject private var settings = AppSettings()
    @StateObject private var soundPlayer = SoundPlayer()
    
    var body: some Scene {
        MenuBarExtra {
            ControlView(viewModel: viewModel, settings: settings, soundPlayer: soundPlayer)
                .onAppear {
                    viewModel.settings = settings
                    viewModel.soundPlayer = soundPlayer
                }
        } label: {
            Text(menuBarText)
                .font(.system(.body, design: .monospaced))
        }
        .menuBarExtraStyle(.window)
    }
    
    private var menuBarText: String {
        let icon = switch viewModel.appState {
        case .idle: "🌊"
        case .working: "🧠"
        case .breakTime: "☕️"
        }
        
        if settings.showTimerInMenuBar {
            let time: TimeInterval? = switch viewModel.appState {
            case .working: viewModel.elapsedTime
            case .breakTime: viewModel.breakTimeRemaining
            default: nil
            }
            
            if let time = time {
                return "\(icon) \(formattedTime(time))"
            }
        }
        
        return icon
    }
    
    private func formattedTime(_ interval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: interval) ?? "00:00"
    }
}

