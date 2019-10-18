# Structs and Classes Lab - 2


## Question 1

Using the Room struct below, write code that demonstrates that it is a value type. 

```swift
struct Room {
     var maxOccupancy: Int
     var length: Double
     var width: Double
}
```
```
var room1 = Room(maxOccupancy: 200, length: 1423.5, width: 1873.73)
var room2 = room1
room2.maxOccupancy = 150

if room2.maxOccupancy == room1.maxOccupancy{
    print("Room is a reference type.")
} else{
    print("Room is a value type.")
}


```

## Question 2

Using the Bike class below, write code that demonstrates that it is a reference type.

```swift
class Bike {
    var wheelNumber = 2
    var hasBell = false
}
```
```
var bike1 = Bike()
var bike2 = bike1
bike2.wheelNumber = 1

if bike1.wheelNumber == 1{
    print("Bike is a reference type.")
} else {
    print("Bike is a value type.")
}
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

```
class Bird: Animal{
    var canFly: Bool
}
```

b. Override the printDescription method to have the instance of the Bird object print out its name and whether it can fly

```
class Bird: Animal{
    var canFly: Bool
    
    override func printDescription(){
        if canFly{
            print("I am a bird named \(name) and I have the ability to fly.")
        } else {
            print("I am a bird named \(name) and I cannot fly.")
        }
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
        if hasBell {
            print("RING!")
        }
    }
}
```

b. Give `LoudBike` a new method called `ringBell(times:)` that rings the bell a given number of times

```
class LoudBike: Bike {
    override func ringBell() {
        if hasBell {
            print("RING!")
        }
    }
    func ringBell(times: Int){
        for _ in 1...times{
            ringBell()
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

```
class Square: Shape{
    var sideLength: Double = 5
}
```

b. Override the `area` and `perimeter` computed values so it returns the area/perimeter of the square as appropriate

```
class Square: Shape{
    var sideLength: Double = 5
    override var area: Double {
        get{
            return sideLength * sideLength
        }
    }
    override var perimeter: Double {
        get{
            return Double(4 * sideLength)
        }
    }
}
```

c. Override the `name` property of `Square` so that it returns a String containing its name ("Square") and its area and perimeter

```
class Square: Shape{
    var sideLength: Double = 5
    override var area: Double {
        get{
            return sideLength * sideLength
        }
    }
    override var perimeter: Double {
        get{
            return Double(4 * sideLength)
        }
    }
    override var name: String {
        get {
            return "Square\nArea: \(self.area)\nPerimeter: \(self.perimeter)"
        }
    }
}
```

d. Create a class `Rectangle` that subclasses from `Shape`.  Give it a `width` property with a default value of 6 and a `height` property with a default value of 4

```
class Rectangle: Shape{
    var width: Double = 6
    var height: Double = 4
}
```

e. Override the `name` property of `Rectangle` so that it returns a String containing its name ("Rectangle") and its area and perimeter.
```
class Rectangle: Shape{
    var width: Double = 5
    var height: Double = 4
    override var area: Double {
        get{
            return width * height
        }
    }
    override var perimeter: Double {
        get{
            return Double((2 * width) + (2 * height))
        }
    }
    override var name: String {
        get {
            return "Rectangle\nArea: \(self.area)\nPerimeter: \(self.perimeter)"
        }
    }
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
```
When the code below is run, each shape will output its respective overriden name, area, and perimeter computed properties. For the purposes of being appended to the Shape array, and because they inherited from the Shape superclass, Rectangle and Square are Shapes. However, they are also both a Square and a Rectangle respectively, which each contain their own implementation of the area, perimeter, and name computed properties. When they are accessed we see each subclass's implementation of these properties. This is a result of polymoprhism.
```

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
struct Point {
    let x: Double
    let y: Double
    func distance(to point: Point) -> Double {
        let horizontalDistance = self.x - point.x
        let verticalDistance = self.y - point.y
        let distanceBetweenTwoPoints = sqrt(horizontalDistance * horizontalDistance + verticalDistance * verticalDistance)
        return distanceBetweenTwoPoints
    }
}

let pointOne = Point(x: 0, y: 0)
let pointTwo = Point(x: 10, y: 10)

print(pointOne.distance(to: pointTwo)) //Prints 14.142135623730951
```


b. Given the above Point object, and Circle object below, add a `contains` method that returns whether or not a given point is on the circle.

```swift
struct Circle {
let radius: Double
let center: Point

func contains(_ pointInQuestion: Point) -> Bool {
    let newPoint = Point(x: self.radius, y: 0)
    
        if pointInQuestion.distance(to: self.center) == self.center.distance(to: newPoint){
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

Hint: Given the radius of a circle and the x value of a point on the circle, the y value of the point is defined by:

```
√(r^2) - (x^2)
```
```
struct Point {
    let x: Double
    let y: Double
    func distance(to point: Point) -> Double {
        let horizontalDistance = self.x - point.x
        let verticalDistance = self.y - point.y
        let distanceBetweenTwoPoints = sqrt(horizontalDistance * horizontalDistance + verticalDistance * verticalDistance)
        return distanceBetweenTwoPoints
    }
}

struct Circle {
    let radius: Double
    let center: Point
    
    func contains(_ pointInQuestion: Point) -> Bool {
        let newPoint = Point(x: self.radius, y: 0)
        
        if pointInQuestion.distance(to: self.center) == self.center.distance(to: newPoint){
            return true
        } else {
            return false
        }
    }
    
    func getRandomPoint() -> Point{
        let xValue = Double.random(in: -radius...radius)
        let yValue = sqrt((self.radius * self.radius) - (xValue * xValue))
        let newPoint = Point(x: xValue, y: yValue)
        return newPoint
    }
}

```

```swift
circleOne.contains(circleOne.getRandomPoint()) //Should always be true
```


## Question 7

a. Create a struct called HangmanModel with 3 properties `targetWord: String`, `numberOfIncorrectGuesses: Int` and `guessedLetters: [Character]`.
```
struct HangmanModel{
    var targetWord = String()
    var numberOfIncorrectGuesses = Int()
    var guessedLetters = [Character]()
}
```

b. Add a method called `playerWon` that returns whether all of the characters in `targetWord` are in `guessedLetters`

```swift
var model = HangmanModel()
model.targetWord = "hello"
model.guessedLetters = ["h","e","o","l"]
model.playerWon() //true
```
```
struct HangmanModel{
    var targetWord = String()
    var numberOfIncorrectGuesses = Int()
    var guessedLetters = [Character]()
    
    func playerWon() -> Bool {
        for char in self.targetWord{
        if !self.guessedLetters.contains(char){
            return false
            }
        }
        return true
    }
}
```

c. Add a method called `printDisplayVersionOfWord` that prints the `targetWord` replacing characters that are not in `guessedLetters` with "\_"

```
var model = HangmanModel()
model.targetWord = "hello"
model.guessedLetters = ["h","l"]
model.printDisplayVersionOfWord()
//prints h_ll_
```
```
struct HangmanModel{
    var targetWord = String()
    var numberOfIncorrectGuesses = Int()
    var guessedLetters = [Character]()
    
    func playerWon() -> Bool {
        for char in self.targetWord{
        if !self.guessedLetters.contains(char){
            return false
            }
        }
        return true
    }
    
    func printDisplayVersionOfWord() -> Void{
        for char in self.targetWord{
            if self.guessedLetters.contains(char){
                print(char, terminator: "")
            } else {
                print("_", terminator: "")
            }
        }
    }
}
```

d. Add a method called `guess(_:)` that takes in a character as input, and updates `guessedLetters` and `numberOfIncorrectGuesses` as appropriate.

```swift
var model = HangmanModel()
model.targetWord = "hello"
model.guess("h")
model.guess("a")
model.guessedLetters // ["h", "a"]
model.numberOfIncorrectGuesses // 1
```
```
struct HangmanModel{
    var targetWord = String()
    var numberOfIncorrectGuesses = Int()
    var guessedLetters = [Character]()
    
    func playerWon() -> Bool {
        for char in self.targetWord{
        if !self.guessedLetters.contains(char){
            return false
            }
        }
        return true
    }
    
    func printDisplayVersionOfWord() -> Void{
        for char in self.targetWord{
            if self.guessedLetters.contains(char){
                print(char, terminator: "")
            } else {
                print("_", terminator: "")
            }
        }
    }
    
    mutating func guess(_ guessedChar: Character){
        let charSet: Set<Character> = Set(self.targetWord)
        print (charSet)
        if charSet.contains(guessedChar) {
            self.guessedLetters.append(guessedChar)
        } else {
            self.guessedLetters.append(guessedChar)
            numberOfIncorrectGuesses += 1
        }
    }
}
```

e. Have `guess(_:)` also print out the current display version of the word, the number of incorrect guesses and if the player has won.
```
struct HangmanModel{
    var targetWord = String()
    var numberOfIncorrectGuesses = Int()
    var guessedLetters = [Character]()
    
    func playerWon() -> Bool {
        for char in self.targetWord{
        if !self.guessedLetters.contains(char){
            return false
            }
        }
        return true
    }
    
    func printDisplayVersionOfWord() -> Void{
        for char in self.targetWord{
            if self.guessedLetters.contains(char){
                print(char, terminator: "")
            } else {
                print("_", terminator: "")
            }
        }
        print()
    }
    
    mutating func guess(_ guessedChar: Character){
        let charSet: Set<Character> = Set(self.targetWord)
        print (charSet)
        if charSet.contains(guessedChar) {
            self.guessedLetters.append(guessedChar)
        } else {
            self.guessedLetters.append(guessedChar)
            numberOfIncorrectGuesses += 1
        }
        self.printDisplayVersionOfWord()
        if playerWon() {
            print("The player (you) have won.")
        } else {
            print("The player (you) have not yet won.")
        }
    }
}
```
