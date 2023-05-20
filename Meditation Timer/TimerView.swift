//
//  TimerView.swift
//  Meditation Timer
//
//  Created by Marius Malyshev on 18.05.2023.
//

import SwiftUI

struct TimerView: View {
    let healthKitManager = HealthKitManager.shared
    
    @State private var currentTime = 120
    @State private var timer: Timer? = nil
    @State private var isTimerRunning = false
    
    var body: some View {
        VStack {
            Text(timeString(time: currentTime))
                .font(.system(size: 60, design: .monospaced))
            VStack {
                HStack {
                    Button(action: {
                        isTimerRunning ? pauseTimer() : startTimer()
                    }) {
                        Text(isTimerRunning ? "Пауза" : "Старт")
                    }
                    Button("Сброс") {
                        resetTimer()
                    }
                }
                Button("Сохранить") {
                    saveToHealth()
                }
            }
        }
    }
    
    func timeString(time: Int) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    func startTimer() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.currentTime += 1
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
        self.currentTime = 0
        self.isTimerRunning = false
    }
    
    func saveToHealth() {
        healthKitManager
            .saveMindfulSession(
                startDate: .now - TimeInterval(currentTime),
                endDate: .now) { saved in
                    print(saved)
                }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
