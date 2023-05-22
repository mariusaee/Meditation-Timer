//
//  TimerView.swift
//  Meditation Timer
//
//  Created by Marius Malyshev on 18.05.2023.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var vm: TimerViewModel
    
    var body: some View {
        VStack {
            Text(vm.timeString(time: vm.secondsPassed))
                .font(.system(size: 60, design: .monospaced))
            VStack {
                HStack {
                    Button(action: {
                        vm.isTimerRunning ? vm.pauseTimer() : vm.startTimer()
                    }) {
                        Text(vm.isTimerRunning ? "Pause" : "Start")
                    }
                    Button("Reset") {
                        vm.resetTimer()
                    }
                }
                Button("Save") {
                    vm.saveToHealth()
                }
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(TimerViewModel())
    }
}
