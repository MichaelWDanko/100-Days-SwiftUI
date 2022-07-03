//
//  ContentView.swift
//  UnitConversion
//
//  Created by Michael Danko on 7/2/22.
//

import SwiftUI



struct ConversionView: View {
    /*
     -- Variables --
     */
    @State var measurementUnit: MeasurementUnit

    @State var inputValue: String = ""
    @State var inputTypeSelection: String = ""

    @State var outputValue: String = ""
    @State var outputTypeSelection: String = ""
    
    /*
     -- Methods --
     */
    private func validateInputFields() {
        if (Double(inputValue) != nil) {
            // It's a number
        } else {
            print("The inputted value of \(inputValue) is not a double. It will be erased.")
            inputValue = ""
        }
    }
    
    func calculateOutputValue() {
        let inputDouble = Double(inputValue)!
        let outputDouble = measurementUnit.convert(value: inputDouble, from: inputTypeSelection, to: outputTypeSelection)
        outputValue = String(outputDouble)
    }
    
    var body: some View {
        NavigationView {
            Form {
/*:
 The following code doesn't work because $inputTypeSelection is set to be an Int and this is somehow expecting a String.
                Picker("Choose a type", selection: $inputTypeSelection) {
                    ForEach(0..<inputTypes.count, id: \.self) {
                        Text(String("\(inputTypes[$0])"))
                    }
                }
*/
                Section {
                    Picker("Convert from:", selection: $inputTypeSelection) {
                        ForEach(measurementUnit.unitsArray, id: \.self) {
                            Text($0)
                        }
                    }
                    TextField("Value", text: $inputValue)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                }
    
                Section {
                    Picker("Convert to:", selection: $outputTypeSelection) {
                        ForEach(measurementUnit.unitsArray, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    HStack {
                        Spacer()
                        Button("Convert", action: {
                            calculateOutputValue()
                        })
                        .buttonStyle(.automatic)
                        Spacer()
                    }
                }
                Section {
                    if outputValue != "" && outputTypeSelection != "" {
                        Text("\(outputValue) \(outputTypeSelection)")
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .navigationTitle("UnitConversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView(measurementUnit: length)
    }
}
