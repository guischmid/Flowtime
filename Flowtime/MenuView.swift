//
//  MenuView.swift
//  Flowtime
//
//  Created by Guilherme on 13.07.25.
//

import SwiftUI

/// A menu‐bar button with a hover/press highlight whose tappable area
/// always matches its visible bounds.
struct MenuItem: View {
    let title: String
    let action: () -> Void

    @State private var isHovering = false

    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        // use a plain style so we fully control the visuals
        .buttonStyle(.plain)

        // ① padding defines your visible bounds…
        .padding(.horizontal, 8)
        .padding(.vertical, 4)

        // ② background highlight for hover or press
        .background(
            Group {
                if isHovering {
                    Color.primary.opacity(0.1)
                        .cornerRadius(4)
                }
            }
        )

        // ③ ensure the entire padded rect is hit-tested
        .contentShape(Rectangle())

        // ④ track hover state
        .onHover { isHovering = $0 }
    }
}

struct MenuView: View {
    @ObservedObject var viewModel: TimerViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            switch viewModel.appState {
            case .idle:
                MenuItem(title: "Start Focusing", action: viewModel.startWorkSession)

            case .working:
                Text("Working for: \(formattedTime(viewModel.elapsedTime))")
                    .font(.headline)
                    .monospacedDigit()
                    .allowsHitTesting(false)
                    .padding([.horizontal, .bottom], 8)

                MenuItem(title: "Stop & Take a Break",
                         action: viewModel.stopWorkSessionAndStartBreak)

            case .breakTime:
                Text("Break: \(formattedTime(viewModel.breakTimeRemaining))")
                    .font(.headline)
                    .monospacedDigit()
                    .allowsHitTesting(false)
                    .padding([.horizontal, .bottom], 8)

                MenuItem(title: "End Break", action: viewModel.endSession)
            }

            Divider()
                .padding(.vertical, 4)

            MenuItem(title: "Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
        .padding(8)
        .frame(width: 220)
    }

    private func formattedTime(_ interval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = interval >= 3600
            ? [.hour, .minute, .second]
            : [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: interval) ?? "00:00"
    }
}
