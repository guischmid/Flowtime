//
//  SoundsTabView.swift
//  Flowtime
//
//  Created by Guilherme on 13.07.25.
//


// In SoundsTabView.swift

import SwiftUI

struct SoundsTabView: View {
    // This view now needs the main AppSettings object
    @ObservedObject var settings: AppSettings

    var body: some View {
        // We use a Form for consistent settings styling
        Form {
            Toggle("Play sound on session start", isOn: $settings.isSessionStartSoundEnabled)
            Toggle("Play sound on break end", isOn: $settings.isBreakEndSoundEnabled)
        }
        .formStyle(.grouped)
    }
}
