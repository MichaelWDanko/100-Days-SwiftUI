//: ## Structs
//: [Previous](@previous) - [Next](@next) - [Introduction](Introduction)

/*
 Structures
 - "Structs" can be given their own values and functions
 - Values within a structure are called properties
 - Properties can have default values, just like regular variables.
 - Structures must be made as variables if you will be updating their values.
 - Structs can have functions inside them, and those functions can use the properties of the struct as they need to.
 - Functions within structs are called methods
 - Methods that modify the properties of a struct must be prefixed with the `mutating` keyword.
 */

struct Dog {
    var name: String
    var breed: String
    var age = 1
    var isMature = false
    
    func bark(count: Int) {
        for _ in 1...count {
            print("bark!")
        }
    }
    
    mutating func hasBirthday() {
        print("\(name) is having a birthday")
        age += 1
        if age >= 4 {
            isMature = true
            print("\(name) is now a mature dog!")
        }
    }
}
var myDog = Dog(name: "Jax", breed: "Labradoodle")
myDog.hasBirthday()
myDog.hasBirthday()
myDog.hasBirthday()

//myDog.bark(count: 3)

print("-----------")

/*
 Stored vs Computed properties
 - Basic properties of a struct are stored properties
 - Properties that belong to structs and runs code to figure out it's value are computed properties
 */

struct ZooAnimal {
    
    var breed: String
    var isAgresssive: Bool
    
    var canBePetted: Bool {
        if isAgresssive {
            return false
        } else {
            return true
        }
    }
}
let bigCat = ZooAnimal(breed: "Tiger", isAgresssive: true)
print("Can I pet the \(bigCat.breed)?")
print(bigCat.canBePetted)
print("-----------")


/*
 Property observers
 - Let you run code before or after a struct's property changes
 - Can use the `willSet` and `didSet` keywords
 - `willSet` gives you access to the `newValue` property
 - `didSet` gives you access to the `oldValue` property
 */

struct Progress {
    var task: String
    var progress: Int {
        willSet {
            print("Changing from \(progress)% to \(newValue)%")
        }
        didSet {
            print("\(task) is now \(progress)% complete.")
        }
    }
    mutating func cutGrass(_ amount: Int) {
        self.progress += amount
    }
}
var cutGrass = Progress(task: "Cut grass", progress: 0)
//cutGrass.progress += 20
//cutGrass.progress += 20
//cutGrass.progress += 60

cutGrass.cutGrass(20)
cutGrass.cutGrass(20)
cutGrass.cutGrass(60)
print("-----------")


/*
 Properties and methods of strings
 - Strings are actually structs behind the scenes
 - You can read the number of characters in a string using its `count` property:
 - They have a hasPrefix() method that returns true if the string starts with specific letters:
 - You can uppercase a string by calling its uppercased() method:
 */
let string = "Do or do not, there is no try."
string.count
string.hasPrefix("Do")

/*
 Properties and methods of arrays
 - Arrays are actually structs behind the scenes
 - Read the number of items in an array using its count property
 - If you want to add a new item, use the append() method
 - Locate any item inside an array using its firstIndex() method
 - To remove an item, use the remove() method
 */
var toys = ["Woody"]

toys.append("Mr.Potato Head")
toys.append("Buzz")
print(toys.firstIndex(of: "Buzz") ?? "unknown")
print(toys)
toys = toys.sorted()
print(toys)
print(toys.firstIndex(of: "Buzz") ?? "unknown")
toys.remove(at: 1)
print(toys)
print("-----------")


/*
 Initializers
 - Special methods that provide different ways to create structs
 - All structs come with one by default, called their memberwise initializer
 - The memberwise initializer will ask for a value to be provided for each property
 - You don’t write func before initializers
 - You do need to make sure all properties have a value before the initializer ends.
 - Use `self.` within methods to refer to the values of the struct itself. This is useful when needing to work with parameters in initializers that have the same name as the properties of the struc
 */
struct User {
    var username: String
}
var user = User(username: "twostraws")

// Can provide our own initializer to replace the default one
// Might want to create all new users as “Anonymous” and print a message
struct User2 {
    var username: String
    var age: Int
    
    init() {
        username = "Anonymous"
        age = 18
        
        print("Creating a new anonymous user and setting the age to 18!")
        
    }
    init(age: Int) {
        username = "Anonymous"
        self.age = age
        
        print("Creating a new anonymous user. Their age is \(age)")
        
    }
    init(age: Int, username: String) {
        self.age = age
        self.username = username
        print("Creating a new user, \(username), and setting the age to \(age)")
    }
}
var james = User2()
var kevin = User2(age: 24)
var ricky = User2(age: 30, username: "rickeybobby2022")
print("-----------")


/*
 Lazy properties
 - As a performance optimization, Swift lets you create some properties only when they are needed
 */

struct FamilyTree {
    var familyMembers = [String]()
    init() {
        print("Creating family tree!")
        
    }
    mutating func addFamilyMembers(_ name: String) {
        self.familyMembers.append(name)
    }
}

// We might use that FamilyTree struct as a property inside a Person struct
// Add the `lazy` keyword to the familyTree property, then Swift will only create the FamilyTree struct when it’s first accessed:
struct Person {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
//        familyTree.addFamilyMembers(self.name)
    }
}

var ed = Person(name: "Ed")
print("We just created \(ed.name)")
print(ed)
ed.familyTree.addFamilyMembers(ed.name)
print(ed)
print("-----------")


/*
 Static properties and methods
 - By default, the properties and methods of a struct belong to individual instances of that struct
 - To share a property across multiple structs, you may create a `static` property.
 */
struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
// Because the classSize property belongs to the struct itself
// rather than instances of the struct, we need to read it using Student.classSize
print("The class size is \(Student.classSize)")
print("-----------")


/*
 Access control
 - Access control lets you restrict which code can use properties and methods.
 - You might want to stop people reading a property directly, for example.
 - Use the `private` keyword to restrict access to a property to only allow the methods within the struct
 */
struct Employee {
    private var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }

    func identify() -> String {
        return "My social security number is \(id)"
    }
}
let jax = Employee(id: "Woof12345", name: "Jax")

// print("My social security number is \(jax.id)") would not work. You must use the identify() method
print(jax.identify())

