import UIKit

// Step 1
protocol Person : AnyObject {
    func getName(name: String)
}

protocol Developer: AnyObject {
    func getSpeciality(speciality: String)
}

// Activity 1
class A: Person, Developer {
    var name = ""
    var organisation: String = "Apple"
    let b = B() // Strong
    
    func sendOrganisation() {
        b.organisation = "Apple"
    }
    
    // Step 3 - initialise the protocol property in receiver
    func setProtocol() {
        b.person = self // A()
        b.developer = self
    }
    
    func getName(name: String) {
        print("received the name from class B: \(name)")
    }
    
    func getSpeciality(speciality: String) {
        print("My speciality is \(speciality)")
    }
}

//B to A
// Activity 2
class B {
    //var name : String = "Ashish"
    var organisation: String = ""
    //let a = A() // Strong
    // Step 2 - Create protocol property in sender
    weak var person: Person? // A() // nil
    weak var developer: Developer?
    
    func sendName() {
        if let person = self.person {
            self.person?.getName(name: "Ashish")
        } else {
            print("Person is nil")
        }
    }
    
    // Step 4
    func sendSpeciality() {
        self.developer?.getSpeciality(speciality: "iOS")
    }
}

class C : Person {
    let b = B()
    
    func setPerson() {
        b.person = self // C()
    }
    
    func getName(name: String) {
        print("Got the name: \(name)")
    }
}

let a = A()
a.setProtocol()
//a.sendOrganisation()
//print(a.b.organisation)
a.b.sendName() // Step 4
a.b.sendSpeciality() // step 4

// Delegation design pattern
let c = C()
c.setPerson()
c.b.sendName()

// Advantages
// avoid retain cycle
// can adopt multiple protocols
// you can send data between classes which are not directly related (inheritance)
