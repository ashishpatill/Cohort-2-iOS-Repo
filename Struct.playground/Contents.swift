import UIKit

struct House {
    var name: String
    var id: Int
    var rooms : Int
    
    // Has default init
}

// if struct is constant we cannot change the variable

var house1 = House(name:"House 100", id: 1111, rooms: 2) // 111
var house2 = House(name: "House 2", id: 222, rooms: 354) /// 222

house1 = house2 ///  different memory location
house2.name = "House 2"
print(house1.id)

