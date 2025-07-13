//
//  AppSettings.swift
//  Flowtime
//
//  Created by Guilherme on 13.07.25.
//


// In AppSettings.swift

import SwiftUI
import LaunchAtLogin

class AppSettings: ObservableObject {
    @AppStorage("showTimerInMenuBar") var showTimerInMenuBar = true
    @AppStorage("autoStartNextSession") var autoStartNextSession = false
    
    // MARK: - Break Rules
    @AppStorage("breakRule1_work") var breakRule1_work = 25
    @AppStorage("breakRule1_break") var breakRule1_break = 5
    
    @AppStorage("breakRule2_work") var breakRule2_work = 50
    @AppStorage("breakRule2_break") var breakRule2_break = 8
    
    @AppStorage("breakRule3_work") var breakRule3_work = 90
    @AppStorage("breakRule3_break") var breakRule3_break = 10
    
    @AppStorage("breakRule4_break") var breakRule4_break = 15
    
    // MARK: - Sound Toggles
    @AppStorage("isSessionStartSoundEnabled") var isSessionStartSoundEnabled = true
    @AppStorage("isBreakEndSoundEnabled") var isBreakEndSoundEnabled = true
    
    @ObservedObject var launchAtLogin = LaunchAtLogin.observable
}
