import UIKit

// Type casting with Dictionary
let dict:[String: Any] = ["name": "Ashish Pisey",
            "age": 30]

if let name = dict["name"] as? String {
    let firstName = name.components(separatedBy: " ").first
    let lastName = name.components(separatedBy: " ").last
    print("FirstName: \(firstName!) LastName: \(lastName!)")
}

if dict["age"] is Int {
    print("yes you are correct")
}

// Type casting with Array
class Car { }
class Acura: Car { }
class Lexus: Car {
    func revEngine() {
        print("Vroom!")
    }
}

let luxuryCars = [Acura(), Lexus(), Acura(), Lexus()]

for car in luxuryCars {
    if let currentCar = car as? Lexus {
        currentCar.revEngine()
    }
}
