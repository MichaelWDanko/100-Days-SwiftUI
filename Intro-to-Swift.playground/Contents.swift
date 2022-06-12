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
for name in names {
    family.insert(name)
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
 */
var wife = [
    "name": "Darby",
    "age": "28",
    "job": "therapist"
]
