//: ## Classes
//: [Previous](@previous) - [Next](@next) - [Introduction](Introduction)


/*:
 ### Compared to Structs
 Classes are similar to structures but have five key differences:
 1. No memberwise initializer
 2. Class inheritance
 3. Copying objects
 4. Deinitializers
 5. Mutability
 */
  
  
  
/*:
 
 1. No default memberwise initializer
* If you have properties in your class, you must initialize them
* Done so using a `init()` method
 
 */
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
let Molly = Dog(name: "Molly", breed: "Labrador")

/*:
 
 2. Class inheritance
* You can create a class from another class
* Your new class will have the same properties and methods as the initial class.
* Swift always makes you call super.init() from child classes
 
 */
class Labradoodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Labradoodle")
    }
}
let Jax = Labradoodle(name: "Jax")

/*:
 
 3. Copying objects
 * When you copy a struct, both values are unique and independent of each other
 * When you copy classes, they point to the same memory

 */
class Singer {
    var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"

print(singer.name)

/*:
 
 4. Deinitializers
 * Similar to initializers, classes can run code when they're being destroyed.
 * Uses the `deinit` method.
 * No parameters are allowed when using a deinitializer
 
 */
class Bird {
    var name = "Pawley"
    func chirp() {
        print("Chirp")
    }
    init() {
        print(name + " is alive!")
    }
    deinit {
        print("Time for \(name) to leave!")
    }
}
for _ in 1...3 {
    let bird = Bird()
    bird.chirp()
}


/*:
 
 4. Mutability
 * Constant structs cannot update their variable properties. The struct itself is constant.
 * Constant classes with variable properties **can** be changed.
 * Classes do not need the `mutating` keyword before methods that can change the variables of a class.
 */

class Artist {
    var name: String
    var genre: String
    init(name: String, genre: String) {
        self.name = name
        self.genre = genre
    }
    func mayNameIs() -> String {
        return "My name is \(name)."
    }
}
class Rapper: Artist {
    init(name: String) {
        super.init(name: name, genre: "Rap")
    }
}
let eminem = Rapper(name: "Eminem")
eminem.mayNameIs()
eminem.name = "Slim Shady"
eminem.mayNameIs()


//: ---
//: ### Additional Notes:

/*:
 Overriding methods
 * Child classes can replace the methods from their parents
 * Uses the `override func` keywords
 */
class Cat {
    var name: String
    func makeNoise() -> String {
        return "Meow"
    }
    init(name: String) {
        self.name = name
    }
    
}
class Tiger: Cat {
    override func makeNoise() -> String {
        return "Rawr"
    }
}

let garfield = Cat(name: "Garfield")
garfield.makeNoise()

let tonyTheTiger = Tiger(name: "Tony")
tonyTheTiger.makeNoise()

/*: ---
 Final classes
 * Sometimes you need to prevent child classes from inheriting your class
 * Swift gives the `final` keyword to prevent inheritance
 
 */
final class Employee {
    var name: String
    var position: String
    var salary: Int
    var employer = "Acme Inc"
    func announce() {
        print("I am \(name) and I work for \(employer)")
    }
    func getNewJob(at business: String) {
        print("\(name) is starting a new job at \(business)")
        employer = business
    }
    
    init(name: String, position: String, annualSalary: Int) {
        self.name = name
        self.position = position
        self.salary = annualSalary
    }
    init(name: String, position: String, hourlyRate: Int) {
        self.name = name
        self.position = position
        self.salary = hourlyRate * 40 * 52
    }
    
    func greeting() -> String {
       return "I am \(name) and am a \(position) and get paid $\(salary) a year."
    }
}
let john = Employee(name: "John", position: "Product Manager", annualSalary: 130_000)
let alex = Employee(name: "Alex", position: "Product Manager", hourlyRate: 35)
john.greeting()
alex.greeting()


print("John's annouce")
john.announce()
print("Alex's announce")
alex.announce()
john.employer = "Wendy's"
//john.getNewJob(at: "Showmars")
alex.announce()
