//
//  SoundPlayer.swift
//  Flowtime
//
//  Created by Guilherme on 13.07.25.
//


// In SoundPlayer.swift

import AVFoundation
import SwiftUI

class SoundPlayer: ObservableObject {
    private var sessionStartPlayer: AVAudioPlayer?
    private var breakEndPlayer: AVAudioPlayer?

    @AppStorage("sessionStartVolume") var sessionStartVolume: Double = 1.0 {
        didSet { sessionStartPlayer?.volume = Float(sessionStartVolume) }
    }
    @AppStorage("breakEndVolume") var breakEndVolume: Double = 1.0 {
        didSet { breakEndPlayer?.volume = Float(breakEndVolume) }
    }

    init() {
        if let sessionStartAsset = NSDataAsset(name: "sessionStartSound") {
            sessionStartPlayer = try? AVAudioPlayer(data: sessionStartAsset.data)
            sessionStartPlayer?.prepareToPlay()
            sessionStartPlayer?.volume = Float(sessionStartVolume)
        }
        
        if let breakEndAsset = NSDataAsset(name: "breakEndSound") {
            breakEndPlayer = try? AVAudioPlayer(data: breakEndAsset.data)
            breakEndPlayer?.prepareToPlay()
            breakEndPlayer?.volume = Float(breakEndVolume)
        }
    }

    func playSessionStart() {
        sessionStartPlayer?.play()
    }

    func playBreakEnd() {
        breakEndPlayer?.play()
    }
}