import UIKit
import Darwin

// int variables with different data types
var unsignedNumber: UInt = 32785
var negativeInt: Int = -30
var positiveInt: Int = 40
var smallInt: Int16 = 20
var bigInt: Int32 = 1049549386
var massiveInt: Int64 = 629640907230607926
// constant 
let intType = type(of: negativeInt)

// string 
var normalString = "Alive without breath, As cold as death; Never thirsty, ever drinking, All in mail never clinking."
var name = "Ashish "
var message = "My name is "
var newmessage =  message + name

// multiline string
var aMultiLineString = """
   Alive without breath,
   As cold as death;
   Never thirsty, ever drinking,
   All in mail never clinking.
"""

// dictionary
var dict = ["key1":"Value1", "Key2": "Value2"]
dict["key3"] = "value3"

//MARK:- conditionals

// if else 
var isMale = false
//isMale.toggle()

if isMale {
    print("I am male")
} else {
    print("I am female")
}

var isAdult = true

if isAdult && isMale {
    print("Buy suite")
} else if isAdult || isMale {
    print("Buy shirt")
} else {
    print("Buy a dress")
}

// Switch case
var age = 60
switch age {
case 20...age:
    print("I am allowed")
case ..<45:
    print("My age is between 20 and 45")
case ..<60:
    print("My age is between 45 and 60")
default:
    print("I dont know")
}

name = "Ashish"
switch name {
case let x where x.isEmpty:
    print("value: \(x)")
    print("Intructor")
default:
    print("default")
}

//MARK: - for loops
var someInt = 7
for i in 0..<5 {
    print(i)
    if i == 2 {
        break
    }
}

//MARK: - while loop
var i = 0
while i < 5 {
    print(i)
    i = i+1
}

let randomeNumber = Int.random(in: 0...10)

//MARK: - Class
class Car {
    var name = ""
    
    init(name:String) {
        self.name = name
    }
}

var mercedez = Car.init(name: "Mercedez") // memory location:- 111
var bmw = Car.init(name: "BMW") // memory location:- 222
mercedez = bmw
bmw.name = "Ford"
print(mercedez.name) // 222
print(bmw.name) // 222

//MARK: - Struct
struct Employer {
    var name = ""
    
    init(name:String) {
        self.name = name
    }
}

var apple = Employer.init(name: "Apple") // memory location:- 111
var samsung = Employer.init(name: "Samsung") // memory location:- 222
apple = samsung
apple.name = "Asus"
print(apple.name) // 111
print(samsung.name) // 222

//MARK: - Equality vs identity operator 
class Person {
    let name:String = "Ashish"
}

let aStudent = Person()
let aTeacher = Person()
//let personType = type(of: aStudent.name)

// identity operator
if aStudent === aTeacher {
    print("condition satified")
} else {
    print("condition not satified")
}

let unkownn = aStudent

// identity operator
if aStudent === unkownn {
    print("condition satified")
} else {
    print("condition not satified")
}

//equality operator
if aStudent.name == aTeacher.name {
    print("condition satified")
} else {
    print("condition not satified")
}

