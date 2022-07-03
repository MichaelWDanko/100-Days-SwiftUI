//
//  Length.swift
//  UnitConversion
//
//  Created by Michael Danko on 7/3/22.
//

let cm = Unit(singularName: "centimeter", pluralName: "centimeters", abbreviation: "cm")
let m = Unit(singularName: "meter", pluralName: "meters", abbreviation: "m")
let km = Unit(singularName: "kilometer", pluralName: "kilometers", abbreviation: "km")
let inch = Unit(singularName: "inch", pluralName: "inches", abbreviation: "in")
let ft = Unit(singularName: "foot", pluralName: "feet", abbreviation: "ft")
let yd = Unit(singularName: "yard", pluralName: "yards", abbreviation: "yd")
let mi = Unit(singularName: "mile", pluralName: "miles", abbreviation: "mi")

let lengthOptions = [cm, m, km, inch, ft, yd, mi]

struct Length: Measurement {

    var type = "length"

    var unitsArray: [Unit]
//    var unitsArray = [
//        "centimeter(s)"
//        ,"meter(s)"
//        ,"kilometer(s)"
//        ,"inche(s)"
//        ,"feet"
//        ,"yard(s)"
//        ,"mile(s)"
//    ]
    var lengthInCentimeters: Double = 0
    
    mutating func convertToSmallest(value: Double, from fromValue: Unit) -> Double {
        // Converting to centimeters
        let fromValueSingularName = fromValue.singularName
        
        switch fromValueSingularName {
        
        case "centimeter":
            return value
        
        case "meter":
            return value * 100
        
        case "kilometer":
            return value * 1000
        
        case "inch":
            return value * 2.54
        
        case "foot":
            return value * 30.48
        
        case "yard":
            return value * 91.44
        
        case "mile":
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
    
    mutating func convert(value: Double, from fromValue: Unit, to toValue: Unit) -> Double {
        
        let toValueSingularName = toValue.singularName
        
        let centimeters = convertToSmallest(value: value, from: fromValue)
        
        switch toValueSingularName {
        
        case "centimeter":
            return centimeters
        
        case "meter":
            return centimeters / 100
        
        case "kilometer":
            return centimeters / 1000
        
        case "inch":
            return centimeters / 2.54
        
        case "foot":
            return centimeters / 30.48
            
        case "yard":
            return centimeters / 91.44
        
        case "mile":
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
    }
}
