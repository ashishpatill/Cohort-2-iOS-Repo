import UIKit

//MARK: - Parent Class
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

class Employee: Person {
    var organisation: String = "Apple"
}

let person = Person(name: "Ashish")

//MARK: - Subclass
class Developer: Employee {
    let speciality: String
    
    init(speciality: String) {
        self.speciality = speciality
        super.init(name: "Ashish", profession: "software engineer")
        //super.init(name: "Ahmed", profession: "Developer")
    }
    
    func develop(appTopic: String) {
        print("Start work on \(appTopic)")
    }
    
    // Function overriding
    override func speak() {
        print("Hi i am an \(speciality) developer")
    }
    
    // Function overloading
    func speak(message: String) {
        print("Hi i am an \(speciality) developer")
    }
}

let iOSDev = Developer.init(speciality: "iOS")
if let profession = iOSDev.profession {
    //print("Hi i am a \(iOSDev.speciality) \(profession) and my name is \(iOSDev.name) and i work at \(iOSDev.organisation)")
}

iOSDev.speak()
