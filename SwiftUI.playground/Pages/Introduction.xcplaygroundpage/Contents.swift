//: ## Introduction
//: ### Table of Contents
//: * [tbd](tbd)
//:

import SwiftUI

/*:
 View protocol
 - The code `struct ContentView: View` creates a new struct called ContentView, saying that it conforms to the View protocol
 - Only requirement is to have a computed property called body that returns some View

 Computed `body` property
 - The code `var body: some View` defines a new computed property called body, which has a type `some View`.
 -
 */

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

/*:
 Modifying program state
 - Views are a function of their state
 - @State allows that value to be stored separately by SwiftUI in a place that can be modified and is prefixed before any variables within a view's struct.
 - @State is only used when dealing with variables or properties within a single view.
 - Ex: `@State private var tapCount = 0`
 */

struct ContentView2: View {
    @State private var tapCount = 0
    
    var body: some View {
        Button("Tap Me") {
            tapCount += 1
        }
    }
}

/*:
 Binding state to use control interfaces
 - While the `@State` property wrapper lets us modify our struct views, it does not work for user interface controls
 - Swift provides us the `$` to say we want to read the value from the @State but also write back any changes that get made.
*/

struct ContentView3: View {
    @State private var name = ""

    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            // ^^The $name designates a two-way binding
            
            Text("Hello, world!")
        }
    }
}

/*:
 Creating views in a loop
 - When needing to create multiple views while in a loop, you can use the `ForEach` view type.
 - Not limited by the 10 view limit
 - Each `ForEach` passes a closure for each item in the specified range
 */
let listOfDogs = [
    "Jaxy"
    ,"Buddy"
    ,"Molly"
]
struct ContentView4: View {
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(5..<10) { number in
                    Text("Row: \(number)")
                }
            }

//: You can recreate the same `ForEach` using the shorthand closure syntax of the `$0` for the parameters.
            Form {
                ForEach(5..<10) {
                    Text("Row: \($0)")
                }
            }
        }
    }
}

/*:
 Using `ForEach` with SwiftUI's `Picker` view
 - Picker requires a label and a two way binding 
 */

struct StudentPicker: View {
    let animals = ["Dogs", "Cats", "Fish"]
    @State var selectedAnimal = "Dogs"
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Pick your favorite animal", selection: $selectedAnimal) {
                    ForEach(animals, id: \.self) { animal in
                        Text(animal)
                    }
                }
            }
            .navigationTitle("Student Picker")
        }
    }
}
