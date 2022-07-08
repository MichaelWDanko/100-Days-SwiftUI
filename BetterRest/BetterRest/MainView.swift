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
                LinearGradient(gradient: Gradient(colors: [.blue, .mint]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                Color.accentColor
                    .opacity(0.20)
                    .ignoresSafeArea()
                    .background(.ultraThinMaterial)
                VStack(spacing: 30) {
                    VStack {
                        Text("When do you want to wake up?")
                            .font(.headline)

                        DatePicker("Please enter a time",
                                   selection: $vm.wakeUp,
                                   displayedComponents: .hourAndMinute)
                        .labelsHidden()
                    }
                    .padding()
                    
                    VStack {
                        Text("How many hours of sleep do you want?")
                            .font(.headline)
                        
    //                    Stepper("\(vm.sleepAmount.formatted()) hours", value: $vm.sleepAmount, in: 4...20, step: 0.25)
                        
                        Stepper("\(vm.sleepAmount.formatted()) hours", value: $vm.sleepAmount,in: 4...20, step: 1) {_ in
                            vm.calculateBedTime()
    //                        self.displayBedTime = true
                        }
                        
                    }
                    .padding()
                    
                    VStack {
                        Text("How many cups of coffee have you had today?")
                            .font(.headline)
                        
    //                    Stepper(value: $vm.coffeeAmount, in: 1...10, step: 1) {
    //                        vm.coffeeAmount == 1 ? Text("1 cup"): Text("\(vm.coffeeAmount) cups")
    //                    }
                        
                        Stepper(vm.coffeeAmount == 1 ? "1 cup" : "\(vm.coffeeAmount) cups",
                                value: $vm.coffeeAmount,
                                step: 1) {_ in
                            vm.calculateBedTime()
//                            self.displayBedTime = true
                        }
                        
                    }
                    .padding()
                    
                    VStack{
                        if displayBedTime {
                            Text("You should go to bed at:")
                                .font(.headline)
                            Text("\(vm.sleepTime.formatted(date: .omitted, time: .shortened))")
                                .font(.largeTitle)
                        } else {
                            Button("Calculate", action: {
                                vm.calculateBedTime()
                                self.displayBedTime = true
                            })
                            .font(.title)
                                .foregroundColor(.primary)
                        }
                    }
                    
                } // End of VStack
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
