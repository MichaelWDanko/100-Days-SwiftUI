//: ## Closures
//: [Previous](@previous) - [Next](@next) - [Introduction](Introduction)

/*
 Closures can:
 1. Create a function and assign it to a variable
 2. Call that function using that variable
 3. Even pass that function into other functions as parameters.
 */
let driving = {
    print("I'm driving in my car")
}
driving()


/*
 Closure parameters
 - Defining parameters for closures is different than functions
 - List parameters inside paranthesis just after the opening brace
 - then write `in` to designate the start of the rest of the body
 - You don't use parameter labels with closures
 */

let singing = { (song: String) in
    print("Im singing \(song)!")
}
singing("Lets get it started")

/*
 Returning values
 - Closures can return values
 - Written similarly to functions but before the `in` keyword
 */

let eating = { (food: String) -> String in
    return "That \(food) was delicious."
}
print(eating("hamburger"))

/*
 Closures as parameters
 - To pass a losure into a function so it can be run inside that function, specify the function parameter type as `() -> Void`.
 - This means "accepts no parameters, and returns nothing"
 */
let flying = {
    print("I'm flying in my private jet.")
}

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I've arrived.")
}
travel(action: flying)

/*
 Trailing closure syntax
 - Applies when the last parameter in a function is a closure
 - If there aren't any other parameters, you can eliminate the paranthesis entirely
 */
let walking = {
    print("I'm walking with my two feet.")
}

travel {
    walking()
}

/*
 Closures as parameters when they accept parameters
 - `() -> Void` is used to indicate no parameters
 - Can fill in the `()` to include parameters
 - Ex: `(String) -> Void
 */
print("-----------")
func travel2(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}
travel2 { (place: String) in
    print("I'm going to \(place) in my car")
}


/*
 Closures with return values
 - Haven been using `() -> Void` to indicate no return value
 - Replace `Void` with the value type being returned
 - Ex: `() -> String` indicates this closure will return a string value
 */
print("-----------")
func travel3(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
travel3 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
// Now when we call travel() using trailing closure syntax,
// our closure code is required to accept a string and return a string:


//Shorthand parameter names
// Swift knows the parameter to that closure must be a string, so we can remove it
travel3 { place -> String in
    return "I'm going to \(place) in my car"
}

// Swift also knows the closure must return a string, so we can remove that:
travel3 { place in
    return "I'm going to \(place) in my car"
}

// As the closure only has one line of code that must be the one that returns the value, so Swift lets us remove the return keyword too
travel3 { place in
    "I'm going to \(place) in my car"
}

// Rather than writing place in we can let Swift provide automatic names for the closure’s parameters.
// These are named with a dollar sign, then a number counting from 0.
travel3 {
    "I'm going to \($0) in my car"
}

func travel4(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}
travel4 {
    "I'm going to \($0) at \($1) miles per hour."
}
travel4 { place, distance in
    return "I'm going to \(place) and it is \(distance) miles away."
}


/*
 Returning closures from functions
 - In the same way that you can pass a closure to a function, you can get closures returned from a function too.
 - Uses `->` twice. Once to indicate the function's return value and then again to indicate the closure's return value
 
 */
print("-----------")
func travel5() -> (String) -> Void {
    //do stuff
    return { destination in
        print("I'm going to \(destination)")
    }
}
let newValue = travel5()
newValue("Charlotte")

/*
 Capturing values within closures
 - If you use external values within your closure, Swift captures them
 - These values are stored alongside the closure and can be modified even if they don't exist anymore
 - The travel function above is recreated below with a counter variable.
 */
print("-----------")
func travel6() -> (String) -> Void {
    var count = 0
    return { destination in
        print("\(count). We're traveling to \(destination)")
        count += 1
    }
}
let destination = travel6()
destination("the Queen city")
destination("the Queen city")
destination("the Queen city")
