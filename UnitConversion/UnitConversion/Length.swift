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
        let fromValueAbbreviation = fromValue.abbreviation
        
        switch fromValueAbbreviation {
        
        case "cm":
            return value
        
        case "m":
            return value * 100
        
        case "km":
            return value * 1000
        
        case "in":
            return value * 2.54
        
        case "ft":
            return value * 30.48
        
        case "yd":
            return value * 91.44
        
        case "mi":
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
        
        let toValueAbbreviation = toValue.abbreviation
        
        let centimeters = convertToSmallest(value: value, from: fromValue)
        
        switch toValueAbbreviation {
        
        case "cm":
            return centimeters
        
        case "m":
            return centimeters / 100
        
        case "km":
            return centimeters / 1000
        
        case "in":
            return centimeters / 2.54
        
        case "ft":
            return centimeters / 30.48
            
        case "yd":
            return centimeters / 91.44
        
        case "mi":
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
        
        
        
//        if unitsArray.contains(fromValue) && unitsArray.contains(toValue) {
//            // Check to make sure the types are within `unitsArray`
//
//            let centimeters = convertToSmallest(value: value, from: fromValue)
//
//            switch toValue {
//
//            case "centimeter(s)":
//                return centimeters
//
//            case "meter(s)":
//                return centimeters / 100
//
//            case "kilometer(s)":
//                return centimeters / 1000
//
//            case "inche(s)":
//                return centimeters / 2.54
//
//            case "feet":
//                return centimeters / 30.48
//
//            case "yard(s)":
//                return centimeters / 91.44
//
//            case "mile(s)":
//                return centimeters / 160934.4
//
//            default:
//                print("""
//                    Something did not work in the switch statement for the `convert` method.
//                    The `value` used was: \(value)
//                    The `fromValue` used was: \(fromValue)
//                    The `toValue` used was: \(toValue)
//                """)
//                return 0
//            }
//        } else {
//            print("Could not convert the value, returning 0")
//            return Double(0)
//        }
    }
}
