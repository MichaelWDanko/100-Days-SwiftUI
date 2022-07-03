//
//  MeasurementUnits.swift
//  UnitConversion
//
//  Created by Michael Danko on 7/3/22.
//

protocol Measurement {
    var type: String {get set}
    var unitsArray: [String] {get set}
    mutating func convertToSmallest(value: Double, from fromValue: String) -> Double
    mutating func convert(value: Double, from fromValue: String, to toValue: String) -> Double
}

struct Unit {
    var singularName: String
    var pluralName: String
    var abbreviation: String
}

struct Length: Measurement {

    var type = "length"
    var unitsArray = [
        "centimeter(s)"
        ,"meter(s)"
        ,"kilometer(s)"
        ,"inche(s)"
        ,"feet"
        ,"yard(s)"
        ,"mile(s)"
    ]
    var lengthInCentimeters: Double = 0
    
    mutating func convertToSmallest(value: Double, from fromValue: String) -> Double {
        // Converting to centimeters
        
        switch fromValue {
        
        case "centimeter(s)":
            return value
        
        case "meter(s)":
            return value * 100
        
        case "kilometer(s)":
            return value * 1000
        
        case "inche(s)":
            return value * 2.54
        
        case "feet":
            return value * 30.48
        
        case "yard(s)":
            return value * 91.44
        
        case "mile(s)":
            return value * 160934.4
        
        default:
            print("""
                Something did not work in`convertToSmallest`.
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
            
            case "inche(s)":
                return centimeters / 2.54
            
            case "feet":
                return centimeters / 30.48
                
            case "yard(s)":
                return centimeters / 91.44
            
            case "mile(s)":
                return centimeters / 160934.4
                
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


struct Temperature: Measurement {
    var type: String = "temperature"
    
    var unitsArray: [String] = ["fahrenheit", "celsius", "kelvin"]
    
    mutating func convertToSmallest(value: Double, from fromValue: String) -> Double {
        // Convert to Celsius
        switch fromValue {
        case "celsius":
            return value
            
        case "fahrenheit":
            return (value - 32) * (5/9)
            
        case "kelvin":
            return value - 273.15
            
        default:
            print("""
                Something did not work in`convertToSmallest`.
                The value used was: \(value)
                The fromValue used was: \(fromValue)
            """)
            return 0
        }
    }
    
    mutating func convert(value: Double, from fromValue: String, to toValue: String) -> Double {
        // Convert from Celsius
        switch fromValue {
        case "celsius":
            return value
            
        case "fahrenheit":
            return (value * 9/5) + 32
            
        case "kelvin":
            return value + 273.15
            
        default:
            print("""
                Something did not work in`convertToSmallest`.
                The value used was: \(value)
                The fromValue used was: \(fromValue)
            """)
            return 0
        }
    }
    
    
}
