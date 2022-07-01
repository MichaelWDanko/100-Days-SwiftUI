//
//  ContentView.swift
//  WeSplit
//
//  Created by Michael Danko on 6/28/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberofPeople = 2
    @State private var tipPercentage = 18
    
    @State private var customTipEnabled = false
    
    var amountPerPerson: Double {
        // calculate the cost per person

        let numberofPeopleDouble = Double(numberofPeople)
        let tipPercentageDouble = Double(tipPercentage)
        
        let checkTotal = checkAmount + (checkAmount * (tipPercentageDouble / i100))
        
        return checkTotal / numberofPeopleDouble
    }
    
    let tipPercentages = [0, 10, 15, 20, 25, 30]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Check Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .keyboardType(.decimalPad)
                    /*
                     Locale is a massive struct built into iOS that is responsible for storing all the user’s region settings – what calendar they use, how they separate thousands digits in numbers, whether they use the metric system, and more. In our case, we’re asking whether the user has a preferred currency code, and if they don’t we’ll fall back to “USD” so at least we have something.
                     */
                } header: {
                    Text("What is the total check amount?")
                }
                
                Section {
                    Stepper(value: $numberofPeople, in: 1...100) {
                        Text("\(numberofPeople)")
                    }
                    
                    /*
                     - There are several ways to create a picker.
                     - The code below shows an example where the label is a string and another option where the label is a view.
                     
                     Picker(selection: $numberofPeople, content: {
                         ForEach(2..<100) {
                             Text("\($0) people")
                         }
                     }, label: {
                         Text("Count")
                     })
                     
                     Picker("Number of people", selection: $numberofPeople) {
                         ForEach(2..<100) {
                             Text("\($0) people")
                         }
                     }
                     
                     */
                } header: {
                    Text("How many people are there?")
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                        .pickerStyle(.segmented)
                } header: {
                    Text("How much would you like to tip?")
                }
                
                Section {
                    Text(amountPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
                
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
