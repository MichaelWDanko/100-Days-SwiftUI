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
    mutating func convertToSmallest(value: Double, from fromValue: String) -> Double
}

struct Length: MeasurementUnit {

    var type = "length"
    var unitsArray = [
        "centimeter(s)"
        ,"meter(s)"
        ,"kilometer(s)"
//        ,"feet"
//        ,"yards"
//        ,"miles"
    ]
    var lengthInCentimeters: Double = 0
    
    mutating func convertToSmallest(value: Double, from fromValue: String) -> Double {
        
        switch fromValue {
        case "centimeter(s)":
            return value
        case "meter(s)":
            return value * 100
        case "kilometer(s)":
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
            
            let centimeters = convertToSmallest(value: value, from: fromValue)
            
            switch toValue {
            
            case "centimeter(s)":
                return centimeters
            case "meter(s)":
                return centimeters / 100
            case "kilometer(s)":
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

let length = Length()
@main
struct UnitConversionApp: App {
    var body: some Scene {
        WindowGroup {
            ConversionView(measurementUnit: length)
        }
    }
}
