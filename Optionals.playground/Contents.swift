import UIKit
import CoreGraphics

//var name: String =  ""
//var name : String?
//name = "Ashish"
//print(name)


var personDict:[String:Any]? = [
                                "age": 30,
                                "conversation": [
                                 "id": 123,
                                 "message": "This is a message"
                                ]
                               ]
//print(personDict)
//personDict = nil
//print(personDict["name"])

//MARK: - Optional unwrapping
// To get actual value from the optional
if  let personDict = personDict,
    let nameStr = personDict["name"] {
    print("inside if let")
    print(nameStr)
} else if let personDict = personDict,
          let age = personDict["age"] {
    print("inside else if let")
    print(age)
}

//MARK: - Optional chaining with Dictionary
func getPersonInfo() -> String? {
    
//    guard let personDict = personDict else {
//        print("personDict is nil")
//        return
//    }
    // response
    guard let name = personDict?["name"] as? String,
          let conversation = personDict?["conversation"] as? [String:Any],
          let message = conversation["message"] as? String,
          let id = conversation["id"] as? Int else {
        // if name is nil
        print("name is nil")
        return nil
    }
    
    print(id)
    print(message)
    print(name)
    return name
}

//getPersonInfo()

//MARK: - Nil Coalesing
func getPersonName() -> String {
    let name = personDict?["name"] as? String
    return name ?? "User"
}

getPersonName()

//MARK: - Optional chaining with Custom object
class ChatUser {
    let name : String?
    let conversation: Conversation?
    
    init(name: String, conversationObj : Conversation) {
        self.name = name
        self.conversation = conversationObj
    }
}

class Conversation {
    let id: String?
    
    init(id:String) {
        self.id = id
    }
}

let conversation = Conversation.init(id: "123")
let chatUser = ChatUser.init(name: "Ashish", conversationObj: conversation)


func getConversationInfo() -> String? {

    // response
    guard let name = chatUser.name,
          let id   = chatUser.conversation?.id else {
        // if name is nil
        print("name is nil")
        return nil
    }
    
    print(id)
    print(name)
    return name
}

getConversationInfo()




