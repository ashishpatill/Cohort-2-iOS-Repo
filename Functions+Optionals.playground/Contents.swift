import UIKit

//MARK: - Functions

// Normal function

func printsth () { // func is the keyword // printsth is the name of the func
    // function body
    print("DOne")
}

printsth() // calling the function



// internal & External parameters

func sumTwoNumbers(number1 num1: Int, number2 num2: Int) { // number1 , number2 are calling Labels -> External paramters
    // num1 & num2 -> Internal parameters
    
    print(num1 + num2)
}

sumTwoNumbers(number1: 6, number2: 5)
//sumTwoNumbers(num1: 6 , num2: 5) -> will give you an error as they are internal params



// Default parameters
func printDefault(printedString: String = "Default one") { // = "Default one" is indicating our default value
    print(printedString)
}

printDefault(printedString: "Not the default one") // Here we have the option to give a parameter or not to the function


// inout parameters

func printNumber(number: Int) {
    var newNumber: Int
    
    newNumber = number
    newNumber += 1
//    number += 1  // Will we have an error here !! YES as swift considered function parameters as CONSTANTS
    print(newNumber)
}

printNumber(number: 7)

var newPrinted = 0 // -> Is an integer with a default value 0

func printNewNumber(number: Int) { // number = 5
    newPrinted = number // newPrinted = 5
    newPrinted += 1 // newPrinted + 1 = 6
    print(newPrinted) // 6
}
// -> I will have newPrinted = 0

printNewNumber(number: 5) // at this moment , the newPrinted wil be 6

print("NEWWWWWWW \(newPrinted)") // if we are using that here we will have it 0 as it's called before the function



var myInt = 1
func changeMyInt(someInt: Int) {
    var someInt = someInt
    someInt = someInt + 1
    print(someInt)
}

changeMyInt(someInt: 5)


//var myInt1 = 1
//func changeMyIntAgain(someInt: Int) {
//    var someInt = someInt
//    someInt = someInt + 1
//    print(someInt)
//}
//changeMyIntAgain(someInt: myInt1) // -> 2
//print(myInt1) // -> 1


var myInt1 = 1
func changeMyIntAgain(someInt: inout Int) {
//    var someInt = someInt // -> this may casue an issue as we need to change in the main paramtere itself not in any other variable
    someInt = someInt + 1
    print(someInt)
}

changeMyIntAgain(someInt: &myInt1) // -> 2
print(myInt1) // -> 2

// return type , optional value , void , data type

func areaCalc(x: Int) -> Int {
    let area = x * x
    return area
}

print(areaCalc(x: 4))


func calculateAreaOfRectangleWithWidth(w: Int, andHeight h: Int) -> Int {
    return w * h
}

var area = calculateAreaOfRectangleWithWidth(w: 10, andHeight: 3)
print(area)


func calculateAreaOfRectangleWithWidthVoid(w: Int, andHeight h: Int) -> Void {
    print( w * h )
}

calculateAreaOfRectangleWithWidthVoid(w: 10, andHeight: 5)


func cycle(miles: Int) -> String { // parameter for this function is an Int -> String
    return "Have a great ride! See you in \(miles) miles!"
}


func buyBicycle(cost: Int) -> (Int) -> String { // (Int) -> String we will consider it as a function with its own parameter and return type and all of the function will be returned for buyBicycle
    print("You just paid $\(cost) for your new bike!")
    
    return cycle
}
// predict the output before running this code in your playground
print(buyBicycle(cost: 500)(30))




// use overload -> the same func name with different data type


func info(input: Int, input1: Int){
    if input > 100 {
        print("This is a large number")
    } else {
        print("This is a small number")
    }
}


func info(input: [Any], input1: Int){
    if input.count > 100 {
        print("This is a long array")
    } else {
        print("This is a short array")
    }
}

info(input: 150, input1: 5)        // This is a large number
info(input: [1,2,3], input1: 6 )    // This is a short array






// Override -> will be handeled in the future




//MARK: - Optionals
