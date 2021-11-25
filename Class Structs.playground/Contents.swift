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
print(house1.name)












class Person {
    let name : String
    
    init(name : String) {
        self.name = name
    }
    
    func displayInfo(age:Int) -> String {
        return "Hello i am \(name). My age is \(age)"
    }
}

let person = Person(name: "Ashish")
//person.name = "Ahmed"

print(person.displayInfo(age: 30))

