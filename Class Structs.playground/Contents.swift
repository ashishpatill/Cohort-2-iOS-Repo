import UIKit
import Foundation

class House {
    var name : String = "House 1"
    // dont have default init
}

var house1 = House() // 111
let house2 = House() // 222

// if class is constant we can change the variable
house1 = house2 // same memory location
house2.name = "House 2"
//print(house1.name)

class Person {
    var name : String
    var profession: String?
    
    //MARK: - Required or Designated initializer
    init(name: String, profession: String? = nil) {
        self.name = name
        self.profession = profession
    }
    
    func displayInfo(age:Int) -> String {
        return "Hello i am \(name). My age is \(age)"
    }
    
    func speak() {
        print("Hello! I am a \(self.profession ?? "Person") and my name is \(self.name)")
        // Note how we refer to the properties using "self"
      }
}

extension Person {
    
    //MARK: - Computed properties
    var firstName: String  {
        let firstName = name.components(separatedBy: " ").first ?? ""
        return firstName
    }
    
    //MARK: - Optional or Convenience initializer
    convenience init(personName: String) {
        self.init(name: personName, profession: "Not employed yet")
    }
    
    //var age: Int
    func displayName() {
        print(self.name)
    }
}

let person = Person(personName: "Ashish")
print(person.profession)
//person.displayName()
//let person = Person(name: "Ashish")
//person.name = "Ahmed"
//print(person.displayInfo(age: 30))

// Default initialiser for String class
let aString = String()


struct Player {
    var name: String = "John doe"
    var age: Int = 0
}

extension Player {
    //MARK: - Custom initializer
    //This is optional since it is inside extension
    init(playerName: String) {
        name = playerName.uppercased()
        print("Adding a new player to the team")
    }
    
    //MARK: - Failable initializer
    init?(age: Int) {
        if age < 40 && age > 16 {
            self.age = age
        } else {
            return nil
        }
    }
}

let mj = Player(name: "Ashish", age: 30)
let sachin = Player(playerName: "Sachin")
print(mj.name)
print(sachin.name)

// age criteria below 40 and above 16
if let newPlayer = Player.init(age: 41) {
    print(newPlayer.age)
} else {
    print("Not initialised")
}

extension Array {
    func middleIndex() -> Int {
        return (self.count/2 - 1)
    }
}

let intArray = Array(1...10)
let middleValue = intArray.middleIndex()

// Designated vs convenience init
//Standard init:

//Designated initializers are the primary initializers for a class. A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain.
//convenience init:

//Convenience initializers are secondary, supporting initializers for a class. You can define a convenience initializer to call a designated initializer from the same class as the convenience initializer with some of the designated initializer’s parameters set to default values. You can also define a convenience initializer to create an instance of that class for a specific use case or input value type.

