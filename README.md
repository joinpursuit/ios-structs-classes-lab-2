# Structs and Classes Lab - 2


## Question 1

Using the Room struct below, write code that demonstrates that it is a value type.

```swift
struct Room {
     let maxOccupancy: Int
     let length: Double
     let width: Double
}
```

My code:
```swift
let emptyRoom = Room(maxOccupanyc: 0, length: 100, width: 40)
```

## Question 2

Using the Bike class below, write code that demonstrates that it is a reference type.

```swift
class Bike {
    var wheelNumber = 2
    var hasBell = false
}
```

My code:
```swift
let bike = Bike()
let otherBike = bike
bike.wheelNumber = 3
bike.hasBell = true
print(otherBike.wheelNumber)
print(otherBike.hasBell)
```

## Question 3

a. Given the Animal class below, create a Bird subclass with a new `canFly` property.

```swift
class Animal {
    var name: String = ""
    func printDescription() {
        print("I am an animal named \(name)")
    }
}
```

My code:
```swift

class Bird: Animal {
    var canFly = true
}
```

b. Override the printDescription method to have the instance of the Bird object print out its name and whether it can fly

```swift

class Bird: Animal {
    var canFly = true
    override func printDescription() {
        print("It is \(canFly) that \(name) can fly")
    }
}
```

## Question 4

```swift
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
```


a. Create a `LoudBike` subclass of Bike.  When you call `ringBell` it should ring the bell in all caps.

```
class LoudBike: Bike {
    override func ringBell() {
        if hasBell() {
           print("RING!") 
        }
    }
}
```

b. Give `LoudBike` a new method called `ringBell(times:)` that rings the bell a given number of times

```
class LoudBike: Bike {
    override func ringBell() {
        if hasBell() {
           print("RING!") 
        }
    }
    
    func ringBell(time: Int) {
        for _ in 1...times {
            print("RING!")
        }
    }
}
```


## Question 5

```swift
class Shape {
    var name: String { return "This is a generic shape" }
    var area: Double { fatalError("Subclasses must override the area") }
    var perimeter: Double { fatalError("Subclasses must override the perimeter") }
}
```

a. Given the `Shape` object above, create a subclass `Square` with a property `sideLength` with a default value of 5.

```swift

class Shape: Square {
    var sideLength = 5
}
```

b. Override the `area` and `perimeter` computed values so it returns the area/perimeter of the square as appropriate

```
class Square: Shape {
    var sideLength = 5
    override var area: Double {return Double(sideLength * sideLength)}
    override var perimeter: Double {return Double(sideLength * 4)}
}
```
c. Override the `name` property of `Square` so that it returns a String containing its name ("Square") and its area and perimeter

```swift
class Square: Shape {
    var sideLength = 5
    override var name:String {return "This a square with an area of \(area) and a perimeter of \(perimeter)"}
    override var area: Double {return Double(sideLength * sideLength)}
    override var perimeter: Double {return Double(sideLength * 4)}
}
```
d. Create a class `Rectangle` that subclasses from `Shape`.  Give it a `width` property with a default value of 6 and a `height` property with a default value of 4

```swift
class Rectangle: Shape {
    var width = 6
    var height = 4
}
```
e. Override the `name` property of `Rectangle` so that it returns a String containing its name ("Rectangle") and its area and perimeter.

```swift
class Rectangle: Shape {
    var width = 6
    var height = 4
    override var name:String {return "This a rectangle with an area of \(area) and a perimeter of \(perimeter)"}
    override var area: Double {return Double(width * height)}
    override var perimeter: Double {return Double((width + height) * 2)}
}
```
f. (BONUS) What happens when you run the code below?  Explain why.

```swift
var myShapes = [Shape]()

myShapes.append(Square())
myShapes.append(Rectangle())

for shape in myShapes {
    print("This is a \(shape.name) with an area of \(shape.area) and a perimeter of \(shape.perimeter)")
}
```
The code above will compile (as intended) as the print statement within the for loop uses string interpolation for the usage of both inherited classes of rectangle and square from the super class of shape, and given this, both inherited classes are of dynamically set to the datatype shape given the context for what they are operated on via polymorphism upon accessing them within the array of myShape.


## Question 6

a. Given the Point object below, complete the `distance` method so that it returns the distance between a given point.

The equation for the distance formula can be found [here](https://www.mathsisfun.com/algebra/distance-2-points.html) and is give by:

```swift
let horizontalDistance = pointOneXValue - pointTwoXValue
let verticalDistance = pointOneYValue - pointTwoYValue
let distanceBetweenTwoPoints = sqrt(horizontalDistance * horizontalDistance + verticalDistance * verticalDistance)
```

`sqrt` is a method in Swift that gives the square root.  Make sure to have `import Foundation` or `import UIKit` to use this method.

```swift
import Foundation

struct Point {
    let x: Double
    let y: Double
    func distance(to point: Point) -> Double {
      //Code in your answer here
      let horizDis = self.x - point.x
      let vertDis = self.y - point.y
      return sqrt(horiz * horiz + vertDis * vertDis)
    }
}

let pointOne = Point(x: 0, y: 0)
let pointTwo = Point(x: 10, y: 10)

print(pointOne.distance(to: pointTwo)) //Prints 14.142135623730951
```


b. Given the above Point object, and Circle object below, add a `contains` method that returns whether or not a given point is on the circle

```swift
struct Circle {
    let radius: Double
    let center: Point
    func contains(_ point:Point) -> Bool {
        if center.distance(to: point) == radius {
            return true
        } else {
            return false
        }
    }
}

let pointOne = Point(x: 0, y: 0)
let circleOne = Circle(radius: 5, center: pointOne)
let pointTwo = Point(x: 5, y: 0)
let pointThree = Point(x: 4, y: 0)
let pointFour = Point(x: sqrt(12.5), y: sqrt(12.5))
circleOne.contains(pointTwo) //true
circleOne.contains(pointThree) // false
circleOne.contains(pointFour) //true
```

c. Add another method to `Circle` that returns a random point on the circle

```swift
struct Circle {
    let radius: Double
    let center: Point
    func contains(_ point:Point) -> Bool {
        if center.distance(to: point) == radius {
            return true
        } else {
            return false
        }
    }
    
    func getRandomPoint() -> Point {
        let x = Double.random(in: -radius...radius)
        let y = sqrt((radius * radius) - (x * x))
        let point = Point(x: x, y: y)
        return point
    }
}
```

Hint: Given the radius of a circle and the x value of a point on the circle, the y value of the point is defined by:

```
√(r^2) - (x^2)
```

```swift
circleOne.contains(circleOne.getRandomPoint()) //Should always be true
```


## Question 7

a. Create a struct called HangmanModel with 3 properties `targetWord: String`, `numberOfIncorrectGuesses: Int` and `guessedLetters: [Character]`.

```swift
struct HangmanModel {
    var targetWord: String
    var numberOfIncorrectGuesses: Int
    var guessedLetters: [Character]
}
```

b. Add a method called `playerWon` that returns whether all of the characters in `targetWord` are in `guessedLetters`

```swift
struct HangmanModel {
    var targetWord: String
    var numberOfIncorrectGuesses: Int
    var guessedLetters: [Character]
    func playerWon () -> Bool {
    for char in targetWord {
        if guessedLetters.contains(char){
            return true
        } else {
            return false
        }
    }
}

var model = HangmanModel()
model.targetWord = "hello"
model.guessedLetters = ["h","e","o","l"]
model.playerWon //true
```

c. Add a method called `printDisplayVersionOfWord` that prints the `targetWord` replacing characters that are not in `guessedLetters` with "\_"

```
struct HangmanModel {
    var targetWord: String = ""
    var numberOfIncorrectGuesses: Int = 0
    var guessedLetters: [Character] = []
    func playerWon () -> Bool {
        var contain = false
        for char in targetWord {
            if guessedLetters.contains(char){
                contain = true
            } else {
                contain = false
            }
        }
        return contain
    }
    func printDisplayVersionOfWord () {
        for char in targetWord {
            if guessedLetters.contains(char) {
                print(char)
            } else {
                print("_")
            }
        }
    }
}

var model = HangmanModel()
model.targetWord = "hello"
model.guessedLetters = ["h","l"]
model.printDisplayVersionOfWord
//prints h_ll_
```

d. Add a method called `guess(_:)` that takes in a character as input, and updates `guessedLetters` and `numberOfIncorrectGuesses` as appropriate.

```swift
struct HangmanModel {
    var targetWord: String = ""
    var numberOfIncorrectGuesses: Int = 0
    var guessedLetters: [Character] = []
    func playerWon () -> Bool {
        var contain = false
        for char in targetWord {
            if guessedLetters.contains(char){
                contain = true
            } else {
                contain = false
            }
        }
        return contain
    }
    func printDisplayVersionOfWord () {
        for char in targetWord {
            if guessedLetters.contains(char) {
                print(char)
            } else {
                print("_")
            }
        }
    }
    mutating func guess (_ userInput: Character) {
        if targetWord.contains(userInput) {
            guessedLetters.append(userInput)
        } else {
            numberOfIncorrectGuesses += 1
        }
    }
}

var model = HangmanModel()
model.targetWord = "hello"
model.guess("h")
model.guess("a")
model.guessedLetters // ["h", "a"]
model.numberOfIncorrectGuesses // 1
```

e. Have `guess(_:)` also print out the current display version of the word, the number of incorrect guesses and if the player has won.

```swift
struct HangmanModel {
    var targetWord: String = ""
    var numberOfIncorrectGuesses: Int = 0
    var guessedLetters: [Character] = []
    func playerWon () -> Bool {
        var contain = false
        for char in targetWord {
            if guessedLetters.contains(char){
                contain = true
            } else {
                contain = false
            }
        }
        return contain
    }
    func printDisplayVersionOfWord () {
        for char in targetWord {
            if guessedLetters.contains(char) {
                print(char)
            } else {
                print("_")
            }
        }
    }
    mutating func guess (_ userInput: Character) {
        if targetWord.contains(userInput) {
            guessedLetters.append(userInput)
        } else {
            numberOfIncorrectGuesses += 1
        }
        printDisplayVersionOfWord()
        print("Number of incorrect guesses:", numberOfIncorrectGuesses)
        if playerWon() == true {
            print("You've won")
        } else {
            print("You've lost")
        }
    }
}
```
