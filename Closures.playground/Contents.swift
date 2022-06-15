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

let walking = {
    print("I'm walking with my two feet.")
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

travel {
    walking()
}
