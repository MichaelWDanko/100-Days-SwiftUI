//: ## Introduction
//: [Next](@next) - [Previous](@previous)
//: ### Table of Contents
//: * [Functions](Functions)
//: * [Closures](Closures)
//: * [Functions](Functions)
//: * [Structs](Structs)
//: * [Classes](Classes)
//: * [Protocols and Extensions](Protocols-and-Extensions)
//: * [Optionals](Optionals)
//: * [Stacks Colors and Frames](Stacks-Colors-and-Frames)



/*
 String interpolation allows you to insert variables into strings.
 */
var age: Int = 29
var name: String
name = "Michael"
print

print("My name is \(name) and I am \(age)")
print(name.hasPrefix("Mi"))

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

// Once you create a variable with an enum, you can skip the enum when changing the value
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
//    print("Happy Birthday! Your first drink is on the house.")
} else {
    canDrink = false
//    print("Unfortunately you're not old enough. I see you're \(customerAge) years old.")
}

/*
 Combining conditions
*/
let goodWeather = false
let haveMoney = false

// Use `&&` to compare if both items are true
if goodWeather && haveMoney {
//    print("It's good weather and I just got paid. Let's go to brunch!")
} else {
//    print("It's either not great weather or I dont have money. I don't want to go.")
}

// Use `||` to compare if either item is true
if goodWeather || haveMoney {
//    print("It's either nice out or I have money. Today is a good day")
} else {
//    print("I have neither good weather or any money. I need to go to work.")
}

/*
 Ternary operator
 - Checks a condition specified in the first value
 - If it’s true returns the second value, but if it’s false returns the third value.
 */
let score1 = 10
let score2 = 20
print(score1 == score2 ? "They are the same score" : "They are different scores")

/* Switch statements
 - Allow you to compare a value to different cases
 - Must be exhaustive and a default value can be provided
 */

let color = "blue"
switch color {
case "red":
    print("The fire is red")
case "blue":
    print("The sky is blue")
case "green":
    print("The grass is green")
default:
    print("I don't know that color")
}

/*
 Range operators
 - `..<` - The half open range operator is up to BUT excluding the final value
 - `...` - The closed ranged operator is up to AND includes the final value
 - You can use `fallthrough` within your switch statements to group similar actions into the same step.
 */
let score = 40

switch score {
case 0..<50:
    fallthrough
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}

/*
 Loops
 - You can loop over arrays & ranges
 */
let albums = ["Red", "1989", "Reputation"]
for album in albums {
    print("\(album) is on Apple Music")
}

// If you don't need the value, you should use an `_` to not create unnecessary variables
print("Players gonna ")
for _ in 1...5 {
    print("play")
}

// While loops will run indefinitely until a condition changes.
// Condition checks will occur at the beginning of the loop
var number = 0
while number < 5 {
    print("Current value of number is \(number). Incrementing it by one.")
    number += 1
}

// Repeat loops use a condition check at the end of each loop.
// Repeat loops will always run at leasts once.
var value1 = 1
repeat {
    print(value1)
    value1 += 1
} while value1 <= 20

// Loops can be ended early by using the `break` keyword
var countDown = 10
while countDown >= 0 {

    if countDown == 4 {
//        print("I'm bored. Let's go now!")
        break
    }
    countDown -= 1
}

// Nest multiple loops and break out of specific ones by assigning a label and `break <label>`
// `continue` will skip the current loop
outerLoop: for i in 1...10 {
    innerLoop: for j in 1...10 {
        
        if i == 6 || j == 6 { continue }
        
        let product = i * j
        print ("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

// Infinite loops can run until they're either broken out of or the condition changes
var counter = 0
while true {
    counter += 1
    if counter == 273 { break }
}
