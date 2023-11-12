//: ## Optionals
//: [Previous](@previous) - [Next](@next) - [Introduction](Introduction)


/*:
 Optionals
 - Optionals are used to identify values do not exist
 - To make a type optional, add a question mark after it.
 */
var age: Int? = nil

/*:
 Unwrapping optionals
 - Use the `if let` syntax to unwrap an optional value with a condition
 */

var name: String? = nil

if let unwrappedName = name {
    print("\(unwrappedName) is a real person")
} else {
    print("We dont know who that is.")
}

name = "Jaxy"
if let unwrappedName2 = name {
    print("\(unwrappedName2) is a real person.")
} else {
    print("We dont know who that is.")
}

/*:
 Unwrapping with guard
 - An alternative to if let is guard let, which also unwraps optionals.
 - If it finds `nil` inside it expects you to exit the function, loop, or condition you used it in.
 - Major difference between `if let` and `guard let` is that your unwrapped optional remains usable after the guard code.
 - Using guard let lets you deal with problems at the start of your functions, then exit immediately. This means the rest of your function is the happy path
 */

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}
greet(name)
greet("Bubba")

/*:
 Force unwrapping
 - If you know an optional has a value, you can use `!` to force unwrap it
 */
let str = "5"
let num = Int(str)
let num2 = Int(str)!
print(num)
print(num2)

/*:
 Implicitly unwrapped optionals
 - Like regular optionals, implicitly unwrapped optionals might contain a value or they might be nil
 - Unlike regular optionals you don’t need to unwrap them in order to use them: you can use them as if they weren’t optional at all.
 - Implicitly unwrapped optionals exist because sometimes a variable will start life as nil, but will always have a value before you need to use it.
 */

struct Person {
    var name: String
    var age: Int
    var job: String!
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
var darby = Person(name: "Darby", age: 29)
print(darby.job)

/*:
 Nil coalescing
 - Nil coalescing operator unwraps the value inside of it and returns the value if there is one.
 - If there isn't a value, a default will be set because this is provided
 */
func username(for id: Int) -> String? {
    if id == 1 {
        return "Jaxasaurous"
    } else {
        return nil
    }
}

let user1 = username(for: 1) ?? "Anonymous"
let user2 = username(for: 2) ?? "Anonymous"


/*:
 Optional chaining
 - When accessing something like a.b.c and b is optional, you can write a question mark after it to enable optional chaining: a.b?.c

 */

let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()



/*:
 Optional try
 -  When we were talking about throwing functions, we looked at this code
 */
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
/*:
 - There are two alternatives to try
 - `try?` changes throwing functions into functions that return an optional.
 - `try!` can be used when you know for sure the function will not fail.
 */
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit")
print("OK!")

/*:
 Failable initializer
 - You can create an initializer using `init?()` that could fail
 - The initializer can return a `nil` value.
 
 */

struct Pet {
    var name: String
    var breed: String
    var age: Int
    
    init?(name: String, breed: String, age: Int) {
        self.name = name
        self.breed = breed
        
        if age < 0 {
            return nil
        } else {
            self.age = age
        }
    }
}

let labrador = Pet(name: "Buddy", breed: "Labrador", age: 8)
let unicorn = Pet(name: "Charlie", breed: "Unicorn", age: -4)


/*:
 Typecasting
 - Sometimes you need to tell Swift that values should be treated as other values.
 */

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]


/*:
 - Swift can see both Fish and Dog inherit from the Animal class, so it uses type inference to make pets an array of Animal
 - To loop over the `pets` array and ask dogs to bark, typecast is needed.
 - Swift will check to see whether each pet is a Dog object, and if it is we can then call makeNoise()
 - Uses a new keyword called as?, which returns an optional: it will be nil if the typecast failed, or a converted type otherwise
 */
for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
