//
//  Meditation_TimerApp.swift
//  Meditation Timer
//
//  Created by Marius Malyshev on 17.05.2023.
//

import SwiftUI

@main
struct Meditation_TimerApp: App {
    let healthKitManager = HealthKitManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear() {
                healthKitManager.requestAuthorization { auth in
                    print("HealthKit authorization: \(auth)")
                }
            }
        }
    }
}
