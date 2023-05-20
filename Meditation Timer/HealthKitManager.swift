//
//  HealthKitManager.swift
//  Meditation Timer
//
//  Created by Marius Malyshev on 18.05.2023.
//

import HealthKit

class HealthKitManager {
    static let shared = HealthKitManager()
    
    private init() {}
    
    private let healthStore = HKHealthStore()
    
    // Проверяем доступность HealthKit
    var isHealthKitAvailable: Bool {
        HKHealthStore.isHealthDataAvailable()
    }
    
    // Запрос разрешения на использование HealthKit
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        guard isHealthKitAvailable else {
            completion(false)
            return
        }
        
        let typesToShare: Set = [HKObjectType.categoryType(forIdentifier: .mindfulSession)!]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: nil) { success, error in
            completion(success)
        }
    }
    
    // Запись медитационной сессии в HealthKit
    func saveMindfulSession(startDate: Date, endDate: Date, completion: @escaping (Bool) -> Void) {
        guard isHealthKitAvailable else {
            completion(false)
            return
        }
        
        let mindfulType = HKObjectType.categoryType(forIdentifier: .mindfulSession)!
        let mindfulSession = HKCategorySample(type: mindfulType, value: 0, start: startDate, end: endDate)
        
        healthStore.save(mindfulSession) { success, error in
            completion(success)
        }
    }
}
