import UIKit

struct Room {
    var maxOccupancy: Int
    var length: Double
    var width: Double
}

let bedroom = Room(maxOccupancy: 10, length: 10, width: 10)
var livingroom = bedroom
livingroom.length = 12
print(livingroom.length == bedroom.length ? "This is a reference type" : "This is a value type" )

class Bike {
  let wheelNumber = 2
  let wheelWidth = 1.3
  var hasBell = true
  func ringBell() {
    if hasBell {
      print("Ring!")
    }
  }
}

class Animal {
    var name: String = ""
    func printDescription() {
        print("I am an animal named \(name)")
    }
}

class Bird: Animal {
    var canFly = true
    override func printDescription() {
        print("I am a bird named \(name) and \(canFly ? "I can fly" : "I cannot fly.")")
    }
}


class LoudBike : Bike {
    override func ringBell() {
        print("Ring!".uppercased())
    }
    func ringBell(times num: Int) {
        for _ in 0...num {
            ringBell()
        }
    }
}

class Shape {
    var name: String { return "This is a generic shape" }
    var area: Double { fatalError("Subclasses must override the area") }
    var perimeter: Double { fatalError("Subclasses must override the perimeter") }
}

class Square: Shape {
    var sideLength : Double = 5
    override var name: String { return "Shape: Square. Area: \(area).  Perimeter: \(perimeter)." }
    override var area: Double {
        return sideLength * sideLength
    }
    override var perimeter: Double { return sideLength * 4}
}

class Rectangle: Shape {
    var width = 6.0
    var height = 4.0
    override var name: String {
        return "Shape: Rectangle. Area: \(area).  Perimeter: \(perimeter)."
    }
    override var area: Double {
        return width * height
    }
    override var perimeter: Double {
        return width * 2 + height * 2
    }
}

var myShapes = [Shape]()

myShapes.append(Square())
myShapes.append(Rectangle())

for shape in myShapes {
    print("This is a \(shape.name) with an area of \(shape.area) and a perimeter of \(shape.perimeter)")
}

struct Point {
    let x: Double
    let y: Double
    func distance(to point: Point) -> Double {
      //Code in your answer here
        let horizontalDistance = self.x - point.x
        let verticalDistance = self.y - point.y
        let distanceBetweenTwoPoints = sqrt(horizontalDistance * horizontalDistance + verticalDistance * verticalDistance)
        return distanceBetweenTwoPoints
    }
}

let pointOne = Point(x: 0, y: 0)
let pointTwo = Point(x: 10, y: 10)

print(pointOne.distance(to: pointTwo)) //Prints 14.142135623730951

struct Circle {
    let radius: Double
    let center: Point
    func contains(_ point: Point) -> Bool {
        center.distance(to: point) == radius ? true : false
    }
    func getRandomPoint() -> Point {
        let x = Double.random(in: -radius...radius)
        let y = sqrt((radius * radius) - (x * x))
        return Point(x: x, y: y)
    }
}

struct HangmanModel {
    var targetWord: String = ""
    var numberOfIncorrectGuesses = 0
    var guessedLetters: [Character] = []
    func playerWon() -> Bool {
        Set(targetWord) == Set(guessedLetters) ? true : false
    }
    func printDisplayVersionOfWord() -> String {
        var displayWord = ""
        for letter in targetWord {
            if !guessedLetters.contains(letter) {
                displayWord += "_"
            } else {
                displayWord += String(letter)
            }
        }
        return displayWord
    }
    mutating func guess(_ char: Character) {
        if targetWord.contains(char) {
            guessedLetters.append(char)
        } else {
            guessedLetters.append(char)
            numberOfIncorrectGuesses += 1
        }
        printDisplayVersionOfWord()
        print(numberOfIncorrectGuesses)
        print("The player has \(playerWon() ? "has won." : "has not won.")")
    }
}
