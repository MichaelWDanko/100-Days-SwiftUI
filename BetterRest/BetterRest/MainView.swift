//
//  ContentView.swift
//  BetterRest
//
//  Created by Michael Danko on 7/7/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var vm = MainViewViewModel()
    
    @State var displayBedTime: Bool = false

    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
                Color.accentColor
                    .opacity(0.10)
                    .ignoresSafeArea()
                Form{
                    Section {
                        Text("When do you want to wake up?")
                            .font(.headline)

                        DatePicker("Please enter a time",
                                   selection: $vm.wakeUp,
                                   displayedComponents: .hourAndMinute)
                        .labelsHidden()
                    }
                    .padding()
                    
                    Section {
                        Text("How many hours of sleep do you want?")
                            .font(.headline)
                        Stepper("\(vm.sleepAmount.formatted()) hours", value: $vm.sleepAmount,in: 4...20, step: 1) {_ in
                            vm.calculateBedTime()
                        }
                        
                    }
                    .padding()
                    
                    Section {
                        Text("How many cups of coffee have you had today?")
                            .font(.headline)
                        
                        Stepper(vm.coffeeAmount == 1 ? "1 cup" : "\(vm.coffeeAmount) cups",
                                value: $vm.coffeeAmount,
                                step: 1) {_ in
                            vm.calculateBedTime()
                        }
                        
                    }
                    .padding()
                    
                    Section{
                        if displayBedTime {
                            Text("You should go to bed at:")
                                .font(.headline)
                            Text("\(vm.sleepTime.formatted(date: .omitted, time: .shortened))")
                                .font(.largeTitle)
                        } else {
                            Button {
                                vm.calculateBedTime()
                                self.displayBedTime = true
                            } label: {
                                HStack {
                                    Spacer()
                                    Text("Calculate Bed Time")
                                        .font(.title)
//                                        .bold()
                                    Spacer()
                                }
                            } // End of Button label
                        }
                    }
                    
                } // End of Form
                .opacity(0.70)
            }
            .navigationTitle("BetterSleep")
            .toolbar {
                if self.displayBedTime == true {
                    Button("Reset", action: {
                        self.displayBedTime = false
                        vm.resetProperties()
                    })
                        .foregroundColor(.primary)
                }
            }
        } // End of NavigationView
    }
} // End of MainView struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .preferredColorScheme(.light)
                .previewInterfaceOrientation(.portrait)
        }
    }
}
