//
//  UnitConversionApp.swift
//  UnitConversion
//
//  Created by Michael Danko on 7/2/22.
//

import SwiftUI

let length = Length(unitsArray: lengthOptions)
let temperature = Temperature(unitsArray: temperatureOptions)

@main
struct UnitConversionApp: App {
    var body: some Scene {
        WindowGroup {
            ConversionView(measurement: temperature)
//            ConversionView(measurement: length)
        }
    }
}
