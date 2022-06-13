import UIKit
import SwiftUI

/*
 String interpolation allows you to insert variables into strings.
 */
var age: Int = 29
var name: String
name = "Michael"
//print("My name is \(name) and I am \(age)")


/*
 Sets
 - Unique lists of things
 - Do not have specific orders
 - Optimized for searching large data sets using the `.contains()` function
 */
var family = Set<String>()
let names = ["Darby", "Michael", "Jax", "Jerry", "Mary", "Susan", "Michael"]
for thingy in names {
    family.insert(thingy)
}
family.contains("Darby")
family.contains("Richard")
//print(family)

/*
 Tuples
 - Tuples allow you to store several values together in a single value.
 - Fixed in size after they're created
 - Cannot change the type of items in a tuple
 - Values can be access by value position or name
 */
var person = (firstName: "Michael", lastName: "Danko", age: 29)
//print("My name is \(person.0) \(person.lastName) and I am \(person.age) years old.")


/*
 Dictionaries
 - Similar to arrays that they store data
 - Let us decide where items should be stored using keys.
 - Using dictionaries are optional so you can provide defaults.
 - Defaults are suggested because values are optional
 */
var darby = [
    "name": "Darby",
    "age": "28",
    "job": "therapist"
]

let wifeName = darby["name"]
let wifeJob = darby["job", default: "therapist"]
let wifeEmployer = darby["employer", default: "Hopeway"]

//print("My wife is named \(wifeName!). She works at \(wifeEmployer) as a \(wifeJob)")


/*
 Collections
 - Arrays, sets, & dictionaries
 - Empty arrays & dictionaries can use square brackets
 - Empty sets require the angle brackets and define the type
 */
var teamDictionary = [String: String]()
var dogBreedArray = [String]()
var numberSet = Set<Int>()

//You can also use the angle brackets with arrays and dictionaries
var insectArray = Array<String>()
var workPetDictionary = Dictionary<String, String>()

// You can add values to a dictionary by creating the new key and assigning it's value.
teamDictionary["Michael"] = "Gamecocks"

/*
 Enumerations
 - Finite lists of things
 */
enum daysOfTheWeek {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

// Can be defined using comma separated lists
enum directions {
    case north, south, east, west
}

// Once you create a variable with an enum, you can skip the enum when resetting the value
var direction = directions.east
direction = .north
//print("Santa lives at the \(direction) pole")

/*
 Enum associated values
- You can attach additional information to each case
*/
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "sports")
print(talking)
print(talking.self)

/*
 Enum raw values
- Enumerations can have values assigned to them as raw values.
 */
enum Planet: String {
    case zero = "Sun"
    case first = "Mercury"
    case second = "Venus"
    case third = "Earth"
}

/*
 Conditions
 
*/
let customerAge = 19
var canDrink: Bool

if customerAge > 21 {
    canDrink = true
    print("You can have a drink!")
} else if customerAge == 21 {
    canDrink = true
    print("Happy Birthday! Your first drink is on the house.")
} else {
    canDrink = false
    print("Unfortunately you're not old enough. I see you're \(customerAge) years old.")
}

// Combining conditions
let goodWeather = true
let haveMoney = false
if goodWeather && haveMoney {
    print("It's good weather and I just got paid. Let's go to brunch!")
} else {
    print("It's either not great weather or I dont have money. I don't want to go.")
}
