//
//  ContentView.swift
//  Meditation Timer
//
//  Created by Marius Malyshev on 17.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TimerView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TimerView: View {
    @State private var currentTime = 0
    @State private var timer: Timer? = nil

    var body: some View {
        VStack {
            Text(timeString(time: currentTime))
                .font(.largeTitle)
            HStack {
                Button("Start") {
                    self.startTimer()
                }
                Button("Pause") {
                    self.pauseTimer()
                }
                Button("Reset") {
                    self.resetTimer()
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
    }

    func pauseTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }

    func resetTimer() {
        self.timer?.invalidate()
        self.timer = nil
        self.currentTime = 0
    }
}


