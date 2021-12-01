import UIKit

struct Point {
  var X: Double
  var Y: Double
}

struct Line {
  var start:Point
  var end: Point
  
  func length() -> Double {
    let startX = start.X - end.X
    let endY = start.Y - end.Y
    let lengthOfLine = sqrt(pow(startX,2) + pow(endY,2))
    return lengthOfLine
  }
}

struct Triangle {
    
    let p1 : Point
    let p2 : Point
    let p3 : Point
      
    init (point1 : Point , point2 : Point , point3 : Point) {
        self.p1 = point1
        self.p2 = point2
        self.p3 = point3
        
    }
    
    func getArea()-> Double {
        let side1 = Line(start: p1, end: p2)
        let side2 = Line(start: p2, end: p3)
        let side3 = Line(start: p3, end: p1)
        
        let length1 = side1.length()
        let length2 = side2.length()
        let length3 = side3.length()
        
        let s = (length1 + length2 + length3)/2 //semi-perimeter
        
        // Heron's Formula
        let area = sqrt(s * (s-length1) * (s-length2) * (s-length3))
        return area
    }
      
}

let p1 = Point(X: 1, Y: -8)
let p2 = Point(X: 8, Y: 9)
let p3 = Point(X: 2, Y: -1)

let triangle = Triangle(point1: p1, point2: p2, point3: p3)
let area = triangle.getArea()
print(area)
