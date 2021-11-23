import UIKit

var array:[Int] = [1,3,4,5]

array.append(7)

array.insert(8, at: 3)

//print(array[2])

array.remove(at: 3)

array.append(6)

class Person {
    var name = ""
    
    init(name: String) {
        self.name = name
    }
}

var taskList: [String] = []
taskList.append("Get Milk")
//print(taskList)

var groceryList = [String]()
groceryList.append("Chocolates")
groceryList.append("Cookies")
//print(groceryList)

var anotherList = Array<String>()
anotherList.append("some task")
//print(anotherList)

var personArr : [Person] = []
let personObj1 = Person.init(name: "Ashish")
personArr.append(personObj1)
let personObj2 = Person.init(name: "Ahmed")
personArr.append(personObj2)

//print(taskList)
taskList.append(contentsOf: groceryList)
//print(taskList)
//taskList.append(contentsOf: ["Buy a Pen", "Get some Groceries", "Complete the assignment"])

for task in taskList {
//    if task == "Chocolates" {
//        break
//    }
    //print(task)
}

for index in 0..<taskList.count {
    let task = taskList[index]
    //print(task)
}

for (index,value) in taskList.enumerated() {
    print("index: \(index), value: \(value)")
}

//for personObj in personArr {
//    let temp = personObj as Person
//    print(temp.name)
//}
//print(taskList.count)


var dict: [String: Any]  = ["name": "Ashish", "location": "Mumbai"]
dict["age"] = 30
//dict = ["age": 30]
//print(dict)

//dict.removeAll()
//print(dict)
//dict.removeValue(forKey: "name")


let age = dict["age"] as! Int
//print(age)

//dict["age"] = nil
//print(dict)

var emptyArr: [String] = []
var emptyDict: [String:String] = [:]
for obj in dict {
    //print(obj)
}

//print(dict.values)

for value in dict.values {
    print(value)
}


