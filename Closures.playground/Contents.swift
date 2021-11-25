import UIKit

//MARK: - Closure syntax
//Closure Syntax:-
//{ (parameters) -> return-type in
//    //your code
//}

let aClosure = { (isInserted: Bool) in
    print("This is a Closure")
}

let sumClosure = { (num1:Int, num2: Int) -> Int in
    print("Sum: \(num1 + num2)")
    return num1 + num2
}

func addition(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

sumClosure(2,3)
sumClosure(6,7)

// Synchronous:- We wait for the response, then move ahead with next code

// Asynchornous:- We wait for the response in background, execute the next function, when response received we return the callback with data

struct Person {
    let name: String
}

struct Chat {
    let message: String
}

func getPersonInfo(name: String) -> String {
    print(name)
    
// timer
    return ""
}

//MARK: -
// Function in api manager
func getPersonInfo(completion:@escaping (Person) -> Void) {
    // reponse
    let person = Person(name:"Ashish")
    
    let seconds = 1.0
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        // Put your code which should be executed with a delay here
        completion(person)
    }
    
}

func getChatInfo(completion:@escaping (Chat) -> Void) {
    // reponse
    let chat = Chat(message: "This is a message")
    
    let seconds = 1.0
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        // Put your code which should be executed with a delay here
        completion(chat)
    }
}

// ViewController
// task 1
print("calling closure 1")
getPersonInfo { user in
    // update UI
    print("this is closure 1")
    print(user.name)
}

print("calling closure 2")
getChatInfo { chat in
    // update UI
    print("this is closure 2")
    print(chat.message)
}

//let myView = UIView()
//UIView.animate(withDuration: 0.5) {
//    //myView.alpha = 0
//}


// task 1 - get person info from api

// task 2 - get conversations

// Synchronous way
// task 1 - 5 secs -> response -> call task 2
// task 2 - 5 secs -> response -> Handle response

// Asynchronous way
// task 1 and task 2
// task 1 -> handle response
// task 2 -> Handle response




















