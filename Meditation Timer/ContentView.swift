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
            .environmentObject(TimerViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
