import UIKit

class Animal {
    var health = 100
    
    // Without Chaining
    func doDamage(_ damage: Int) -> Int { // Note the return type
        health -= damage
        return health                              // Note the returned value is self
    }
    
    func healYourself() -> Int {
        health += 10
        return health
    }
    
    // With Chaining
    func takeDamage(_ damage: Int) -> Animal { // Note the return type
        health -= damage
        return self                              // Note the returned value is self
    }
    
    func makeDamageToSelf(_ damage: Int) -> Self { // Note the return type
        health -= damage
        return self                              // Note the returned value is self
    }
    
    func heal() -> Animal {
        health += 10
        return self
    }
}

class Cat: Animal {
    var diet: String
    
    init( diet: String) {
        self.diet = diet
    }
    
    func eatFood(food: String) -> Cat {
        diet = food
        return self
    }
}

var cat = Cat.init(diet: "Milk")
//cat.takeDamage(10).takeDamage(10).heal().heal().heal()
//print(cat.health)
//
//cat.doDamage(10)
//cat.health = 0
//cat.doDamage(10)
//print(cat.health) // invalid return value in negative

cat.takeDamage(10).eatFood(food: "chocolate") // returns an error, understand and comment this
cat.eatFood(food: "chocolate").takeDamage(10)
print(cat.diet)

cat.makeDamageToSelf(10).eatFood(food: "Milk")
print(cat.diet)
print(cat.health)
