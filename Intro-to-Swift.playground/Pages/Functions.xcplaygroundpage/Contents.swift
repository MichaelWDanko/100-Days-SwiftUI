//: ## Functions
//: [Previous](@previous) - [Next](@next) - [Introduction](Introduction)

func printHelp() {
    let message = "Help is on the way!"
    print(message)
}
printHelp()

// Functions can take inputs called "parameters"
func squareNumber(number: Int) -> Int {
    return number * number
}
let result = squareNumber(number: 4)

// Function parameters can have internal and external labels.
//      The first label is used when you call the function.
//      The second label is used internally when working with the function.
// If you need to return multiple values, you can define a tuple
func plusOne(numberOne one: Int, numberTwo two: Int) -> (numberOne: Int, numberTwo: Int){
    let resultOne = one + 1
    let resultTwo = two + 1
    return (resultOne, resultTwo)
}
let result2 = plusOne(numberOne: 1, numberTwo: 2)


// If labels are not needed, they can be ommitted using the `_` label
func greetPerson(_ personName: String) {
    print("Hello \(personName)")
}
greetPerson("Jimmy")

// Default parameters are values assigned when defining the function
// Using default parameters make them optional to set when calling the function

func promotePerson(_ person: String, decision: Bool = true) {
    if decision {
        print("Congrats \(person) on the new role.")
    } else {
        print("I'm sorry \(person), we don't have the budget.")
    }
}
promotePerson("Kevin")
promotePerson("Ricky", decision: false)


/*
 Variadic functions
 - Accept any number of parameters
 - Created by adding a trailing `...` when defining the function parameter
*/
func plusTwo(numbers: Int...) -> [Int] {
    var array = [Int]()
    for value in numbers {
//        print("Using value: \(value)")
        
        let newValue = value + 2
        
        array.append(newValue)
//        print("Appended new value: \(newValue)")
    }
    return array
}
plusTwo(numbers: 2, 5, 8, 10)

/*
 Throwing functions
 - Functions that can cause errors
 - Must return a type that conforms to Swift's `Error` type
 - When using throwing functions, you must use `do`, `try`, and `catch` keywords
 */

enum PasswordErrors: Error {
    case obvious
}
func passwordChecker(_ pw: String) throws -> Bool {
    if pw == "password" {
        throw PasswordErrors.obvious
    }
    return true
}

do {
    try passwordChecker("doggy123")
    print("That's a good password")
} catch {
    print("You can't use that password")
}

do {
    try passwordChecker("password")
    print("That's a good password")
} catch {
    print("You can't use that password")
}

/*
 Inout functions
 - Normally functions do not allow the modification of the input variables
 - Inout functions modify the inputs directly
 - Created using the `inout` keyword when defining the parameter before you set the type
 - When calling functions with inout parameters, you must use `&` before the parameter
 */

func convertToDogYears(number: inout Int) {
    number *= 7
}
var age = 10
convertToDogYears(number: &age)

/*
 Returning multiple values from functions
 - Since Tuples store a fixed number of values of specific types, they are a convenient way to return multiple values from a function
 */


enum DogBreeds: String {
    case labrador = "Labrador"
    case labradoodle = "Labradoodle"
}

enum Genders {
    case male
    case female
}

enum PetLocations {
    case unknown
    case home
    case vet
}

enum PetErrors: Error {
    case missing
}

func getPet(location: PetLocations) throws -> (name: String, breed: DogBreeds, gender: Genders, location: PetLocations) {
    
    if location == .unknown {
        throw PetErrors.missing
    }
    return (name: "Jax", breed: .labradoodle, gender: .male, location: location)
}


do {
//    let jax = try getPet(location: .unknown)
    let jax = try getPet(location: .home)
    print("This is my dog \(jax.name). They are a \(jax.gender) \(jax.breed) and they are currently at \(jax.location).")

} catch PetErrors.missing {
    print("I could not get a pet. It is missing!")
} else catch {
    print("I could not get a pet. I don't know why I failed.")
}

//let jax = getPet()


