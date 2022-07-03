//
//  Temperature.swift
//  UnitConversion
//
//  Created by Michael Danko on 7/3/22.
//

let fahrenheit = Unit(singularName: "fahrenheit", abbreviation: "Fº")
let celsius = Unit(singularName: "celsius", abbreviation: "Cº")
let kelvin = Unit(singularName: "kelvin", abbreviation: "Kº")

let temperatureOptions = [fahrenheit, celsius, kelvin]

struct Temperature: Measurement {
    var type = "temperature"
    
    var unitsArray: [Unit]
    
    mutating func convertToSmallest(value: Double, from fromValue: Unit) -> Double {
        // Convert to Celsius
        
        let fromValueSingular = fromValue.singularName
        
        switch fromValueSingular {
        case "Cº":
            return value

        case "Fº":
            return (value - 32) * (5/9)

        case "Kº":
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
    
    mutating func convert(value: Double, from fromValue: Unit, to toValue: Unit) -> Double {
        // Convert from Celsius
        
        let toValueSingularName = toValue.singularName
        let celsius = convertToSmallest(value: value, from: fromValue)
        
        
        switch toValueSingularName {
        case "celsius":
            return celsius

        case "fahrenheit":
            return (celsius * 9/5) + 32

        case "kelvin":
            return celsius + 273.15

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


/*
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
*/
