//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

let firstName = "Michael"
let lastName = "Danko"

class Person {
    let firstName: String
    let lastName: String
    var username: String
    var job: String?
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.username = firstName + lastName
        self.job = nil
    }
    init(firstName: String, lastName: String, job: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.username = firstName + lastName
        self.job = job
    }
}

var m = Person(firstName: firstName, lastName: lastName)
print(m.username)


//: [Next](@next)
