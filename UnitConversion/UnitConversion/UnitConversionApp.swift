//
//  UnitConversionApp.swift
//  UnitConversion
//
//  Created by Michael Danko on 7/2/22.
//

import SwiftUI


protocol MeasurementUnit {
    var type: String {get set}
    var unitsArray: [String] {get set}
    mutating func convert(value: Double, from fromValue: String, to toValue: String) -> Double
}

struct Length: MeasurementUnit {

    var type = "length"
    var unitsArray = [
        "centimeters"
        ,"meters"
        ,"kilometers"
//        ,"feet"
//        ,"yards"
//        ,"miles"
    ]
    var lengthInCentimeters: Double = 0
    
    
//    var newLength: Double = 0

    //    enum units: String, CaseIterable {
//        case centimeters = "centimeters"
//        case meters = "meters"
//    }
//    var units = ["centimeters", "meters", "kilometers", "feet", "yards", "miles"]
    
    mutating func convertToCentimeters(value: Double, from fromValue: String) -> Double {
        
        switch fromValue {
        case "centimeters":
            return value
        case "meters":
            return value * 100
        case "kilometers":
            return value * 1000
        default:
            print("""
                Something did not work in`convertToCentimeters`.
                The value used was: \(value)
                The fromValue used was: \(fromValue)
            """)
            return 0
        } // end of switch statement
        
    } // end of convertToCentimeters
    
    mutating func convert(value: Double, from fromValue: String, to toValue: String) -> Double {
        
        if unitsArray.contains(fromValue) && unitsArray.contains(toValue) {
            // Check to make sure the types are within `unitsArray`
            
            let centimeters = convertToCentimeters(value: value, from: fromValue)
            
            switch toValue {
            
            case "centimeters":
                return centimeters
                
            case "meters":
                return centimeters / 100
                
            case "kilometers":
                return centimeters / 1000
                
            default:
                print("""
                    Something did not work in the switch statement for the `convert` method.
                    The `value` used was: \(value)
                    The `fromValue` used was: \(fromValue)
                    The `toValue` used was: \(toValue)
                """)
                return 0
            }
        } else {
            print("Could not convert the value, returning 0")
            return Double(0)
        }
    }
}

//let lengthTypes = ["centimeters", "meters", "kilometers", "feet", "yards", "miles"]
let length = Length()
@main
struct UnitConversionApp: App {
    var body: some Scene {
        WindowGroup {
            ConversionView(measurementUnit: length)
        }
    }
}
