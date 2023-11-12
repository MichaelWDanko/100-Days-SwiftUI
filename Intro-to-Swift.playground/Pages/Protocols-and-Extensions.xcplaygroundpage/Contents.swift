//: ## Protocols and Extensions
//: [Previous](@previous) - [Next](@next) - [Introduction](Introduction)

import Foundation

/*:
 - Protocols are a way of describing what properties and methods something must have
 - You don't create instances of protocols, you create things that conform to protocols
 */

protocol Identifiable {
    var id: String {get set}
    var name: String {get set}
}

struct Person: Identifiable {
    var id: String
    var name: String
    
    init(name: String) {
        self.id = UUID.init().uuidString
        self.name = name
    }
}
let mike = Person(name: "Michael")

/*:
 Protocols can be used similar to types when defining parameters for functions
*/
func getIdentity(thing: Identifiable) -> String {
    return "Hello, my name is \(thing.name) and my id is \(thing.id)"
}
getIdentity(thing: mike)

/*:
 Protocol inheritance
 - Protocols can inherit the properties from another protocol.
 - Unlike with classes, you can inherit multiple protocols at once before adding your own properties
 */
protocol Animal {
    var legCount: Int {get set}
}
protocol Dog {
    var doesShed: Bool {get set}
    func bark()
}
protocol Pet: Animal, Dog {
    func playFetch()
}

struct Labradoodle: Pet {
    var legCount: Int
    
    var doesShed: Bool
    
    func bark() {
        print("Bark bark!")
    }
    func playFetch() {
        print("I love tennis balls")
    }
}

let jax = Labradoodle(legCount: 4, doesShed: false)
jax.bark()
jax.playFetch()

/*:
 Extensions
 - Extensions allow you to add methods to existing types, to make them do things they weren’t originally designed to do.
 */
extension Int {
    func squared() -> Int {
        return self * self
    }
}
let number = 4
number.squared()

extension Int {
    func isEvenBool() -> Bool {
        if self % 2 == 0 {
            return true
        } else {
            return false
        }
    }
    var isEven: Bool {
        return self % 2 == 0
    }
}
number.isEven
number.isEvenBool()

/*:
 Protocol extensions
 - Protocols let you describe what methods something should have, but don’t provide the code inside.
 - Extensions let you provide the code inside your methods, but only affect one data type
 - Protocol extensions solve both those problems
 */

protocol FarmAnimal {
    var type: String {get set}
    var numberOfLegs: Int {get set}
}
struct Cow: FarmAnimal {
    var type = "cow"
    var numberOfLegs = 4
}
struct Chicken: FarmAnimal {
    var type = "chicken"
    var numberOfLegs = 2
}
extension FarmAnimal {
    func legCount() -> String {
        return "The \(type) has \(numberOfLegs) legs"
    }
}
let cow = Cow()
let chicken = Chicken()

cow.numberOfLegs
chicken.numberOfLegs



