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
    @State var measurement: Measurement

    @State var inputValue: String = ""
    @State var inputTypeSelection = Unit()

    @FocusState var inputIsFocused: Bool

    @State var outputValue: String = ""
    @State var outputTypeSelection = Unit()
    
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
        let inputDouble = Double(inputValue) ?? Double(0)
        let outputDouble = measurement.convert(value: inputDouble, from: inputTypeSelection, to: outputTypeSelection)
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
                // Values to be converted from
                    Picker("Measurement type", selection: $inputTypeSelection) {
                        ForEach(measurement.unitsArray, id: \.self) { unit in
                            Text(
                                String(unit.dynamicLabel).capitalized
                            )
                        }
                    }
                    TextField("Value", text: $inputValue)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .focused($inputIsFocused)
                    
//                    if inputValue != "" && inputTypeSelection != "" {
//                        Text("\(inputValue) \(inputTypeSelection)")
//                            .frame(maxWidth: .infinity, alignment: .trailing)
//                    }
                } header: {
                    Text("Convert from")
                }
    
                Section {
                // Values to be converted to
                    Picker("Measurement type", selection: $outputTypeSelection) {
                        ForEach(measurement.unitsArray, id: \.self) { unit in
                            Text(
                                String(unit.dynamicLabel).capitalized
                            )
                        }
                    }
                } header: {
                    Text("To:")
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
                    if outputValue != "" && outputTypeSelection.abbreviation != "" {
                        Text("\(outputValue) \(outputTypeSelection.singularName)")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .navigationTitle("UnitConversion")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard, content: {
                    Spacer()
                    Button("Done", action: {
                        inputIsFocused = false
                    })
                })
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView(measurement: length)
    }
}
