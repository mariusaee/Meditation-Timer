//
//  TimerViewModel.swift
//  Meditation Timer
//
//  Created by Marius Malyshev on 22.05.2023.
//

import Foundation
import HealthKit

class TimerViewModel: ObservableObject {
    private let healthKitManager = HealthKitManager.shared
    
    @Published var secondsPassed = 0
    @Published var timer: Timer? = nil
    @Published var isTimerRunning = false
    
    func timeString(time: Int) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    func startTimer() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.secondsPassed += 1
        }
        self.isTimerRunning = true
    }
    
    func pauseTimer() {
        self.timer?.invalidate()
        self.timer = nil
        self.isTimerRunning = false
    }
    
    func resetTimer() {
        self.timer?.invalidate()
        self.timer = nil
        self.secondsPassed = 120
        self.isTimerRunning = false
    }
    
    func saveToHealth() {
        healthKitManager
            .saveMindfulSession(
                startDate: .now - TimeInterval(secondsPassed),
                endDate: .now) { saved in
                    print(saved)
                }
    }
}

