import UIKit

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
    let name : String
    let profession: String?
    
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

let person = Person(name: "Ashish")
//person.name = "Ahmed"
//print(person.displayInfo(age: 30))



