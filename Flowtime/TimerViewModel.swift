import Foundation
import Combine
import KeyboardShortcuts

enum AppState {
    case idle
    case working
    case breakTime
}

class TimerViewModel: ObservableObject {
    @Published var appState: AppState = .idle
    @Published var elapsedTime: TimeInterval = 0
    @Published var breakTimeRemaining: TimeInterval = 0
    
    var soundPlayer: SoundPlayer?
    var settings: AppSettings?
    private var timer: AnyCancellable?
    
    
    init() {
            KeyboardShortcuts.onKeyUp(for: .startStopTimer) { [weak self] in
                // When the shortcut is pressed, call our existing action
                self?.startStopAction()
            }
        }
    
    func startStopAction() {
        switch appState {
        case .idle:
            startWorkSession()
        case .working:
            stopWorkSessionAndStartBreak()
        case .breakTime:
            endSession()
        }
    }

    func startWorkSession() {
        // Check if the setting is enabled before playing
        if settings?.isSessionStartSoundEnabled == true {
            soundPlayer?.playSessionStart()
        }
        appState = .working
        elapsedTime = 0
        timer?.cancel()
        
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.elapsedTime += 1
            }
    }

    func stopWorkSessionAndStartBreak() {
        timer?.cancel()
        
        guard let settings = settings else { return }

        let workMinutes = elapsedTime / 60
        
        if workMinutes <= Double(settings.breakRule1_work) {
            breakTimeRemaining = Double(settings.breakRule1_break) * 60
        } else if workMinutes <= Double(settings.breakRule2_work) {
            breakTimeRemaining = Double(settings.breakRule2_break) * 60
        } else if workMinutes <= Double(settings.breakRule3_work) {
            breakTimeRemaining = Double(settings.breakRule3_break) * 60
        } else {
            breakTimeRemaining = Double(settings.breakRule4_break) * 60
        }
        
        startBreak()
    }
    
    private func startBreak() {
        appState = .breakTime
        timer?.cancel()
        
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                if self.breakTimeRemaining > 0 {
                    self.breakTimeRemaining -= 1
                } else {
                    // Check if the setting is enabled before playing
                    if self.settings?.isBreakEndSoundEnabled == true {
                        self.soundPlayer?.playBreakEnd()
                    }
                    
                    if self.settings?.autoStartNextSession == true {
                        self.startWorkSession()
                    } else {
                        self.endSession()
                    }
                }
            }
    }
    func endSession() {
        timer?.cancel()
        appState = .idle
        elapsedTime = 0
        breakTimeRemaining = 0
    }
}
