//
//  Protocols.swift
//  UnitConversion
//
//  Created by Michael Danko on 7/3/22.
//

protocol Measurement {
    var type: String {get set}
    var unitsArray: [Unit] {get set}
    mutating func convertToSmallest(value: Double, from fromValue: Unit) -> Double
    mutating func convert(value: Double, from fromValue: Unit, to toValue: Unit) -> Double
}
