//
//  MainViewViewModel.swift
//  BetterRest
//
//  Created by Michael Danko on 7/7/22.
//

import Foundation
import CoreML

class MainViewViewModel: ObservableObject {
    
    @Published var wakeUp: Date = Date.now
    @Published var sleepAmount: Double = 8.0
    @Published var coffeeAmount: Int = 1
    
    @Published var sleepTime: Date = Date.now
    
    init() {
        
    }
    
    
    
    func calculateBedTime() {
        // add stuff
        print("Calling calculateBedTime()")
        
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hourInSeconds = (components.hour ?? 0) * 60 * 60
            let minuteInSeconds = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hourInSeconds + minuteInSeconds),
                                                  estimatedSleep: sleepAmount,
                                                  coffee: Double(coffeeAmount))
            
            sleepTime = wakeUp - prediction.actualSleep
            
        } catch {
            print("ERROR: Something went wrong calculating your bedtime")
        }
    }
    
    func resetProperties() {
        self.wakeUp = Date.now
        self.sleepAmount = 8.0
        self.coffeeAmount = 1
    }
}


