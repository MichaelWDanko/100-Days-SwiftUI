//
//  ContentView.swift
//  WeSplit
//
//  Created by Michael Danko on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount: Double? = nil
    @State private var numberOfPeople = 2;
    
    @State private var tipPercentages = [
        "No Tip", "10", "20", "30", "Custom"
    ]
    @State private var selectedTipPercentage = "20"
    @State private var customTipAmount = 0.0
    
    private var amountPerPerson : Double {
        
        switch selectedTipPercentage {
        case "No Tip":
            print("There is no tip!")
            return (checkAmount ?? 0.0) / Double(numberOfPeople)
        case "Custom":
            print("The customTipAmount is: \(customTipAmount)")
            return ((checkAmount ?? 0.0) * customTipAmount) + (checkAmount ?? 0.0) / Double(numberOfPeople)
        default:
            let tipPercentage = ((Double(selectedTipPercentage) ?? 0.0) / 100)
            print("The tipPercentage is \(tipPercentage)")
            return ((((checkAmount ?? 0.0) * tipPercentage) + (checkAmount ?? 0.0)) / Double(numberOfPeople))
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("How much is the total?") {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .submitLabel(.continue)
                        .keyboardType(.decimalPad)
                }
                
                Section("How many people are there?") {
                    Stepper(value: $numberOfPeople, in: 2...15, label: {
                        Text("\(numberOfPeople)")
                    })
                }
                
                Section("Tip Percentage") {
                    Picker("Choose a tip percentage", selection: $selectedTipPercentage, content: {
                        ForEach(tipPercentages, id: \.self) { percent in
                            if percent == "No Tip" || percent == "Custom" {
                                Text("\(percent)")
                            } else {
                                Text("\(percent)%")
                            }
                        }
                    })
                    .pickerStyle(.segmented)
                    
                    if selectedTipPercentage == "Custom" {
                        TextField("Amount", value: $customTipAmount, format: .percent)
                            .keyboardType(.numberPad)
                    }
                }
                
                Section("Amount Per Person") {
                    Text(amountPerPerson, format: .currency(code: "USD"))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
