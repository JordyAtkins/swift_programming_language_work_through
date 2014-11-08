import UIKit

/* A swift tour */
println("Hello, world!")

// Variables
var myVar = 42
myVar = 50

// Constants
let myConstant = 50

// Implicit type
let implicitInt = 70
let implicitDouble = 70.0

// Explicit variable
let explicitDouble: Double = 70

// Experiment "Create a constant with an explicit type of float and a value of 4"
let explicitFloat: Float = 4

// Explicitly make an instance of desired type
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

// Formatting strings with variables
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

// Create an array
var shoppingList = ["beer", "beef", "noodles", "rum"]
shoppingList[0]

// Create a dictionary
var occupations = [
    "Malcom": "Captain",
    "Kaylee": "Mechanic"
]

occupations["Jordon"] = "Developer"

// Create an empty array
let emptyStringArray = [String]()

// Empty dictionary
let emptyDictionary = [String: Float]()

// When the type can be inferred, the type can be omitted
shoppingList = []
occupations = [:]

/* Control flow. */
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
teamScore

// The ? way
var optionalString: String? = "Hello"
optionalString = nil

var optionalName: String? = "Jordon Atkins"
var greeting: String

if let name = optionalName{
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, I'm sorry but I don't know your name"
}


// Switch
let vegetable = "red pepper"

switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log"
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich"
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}

// Usage for-in
let interestingNumbers​ = [
    "Prime": [2,3,5,7,11, 13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25],
    ]

var largest = 0
var type: String = ""
for (key, value) in interestingNumbers​ {
    for number in value {
        if number > largest {
            largest = number
            type = key
        }
    }
}

println(String(largest))
println(type)

// While loops

var n = 2
while n < 100 {
    n = n * 2
}

n

// do while
var m = 2
do {
    m = m * 2
} while m < 100

m

// For loops
var firstExample = 0

for i in 0..<4 {
    firstExample += i
}

var secondExample = 0
for var i = 0; i < 4; ++i {
    secondExample += i
}

println(firstExample)
println(secondExample)

/* Functions and Closures */
func greet (name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet("User", "Saturday")

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = calculateStatistics([5,3,100,3,9])
statistics.sum
statistics.2


// Splat args
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    
    return sum
}

sumOf()
sumOf(42,597, 12)

func avg(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    
    return sum / numbers.count
}

avg(1,5,9)
avg(2,5,13)
avg(11,123,425,123,1)


// Functions can be nested
func returnFifteen() -> Int {
    var y = 10
    
    func add() {
        y += 5
    }
    
    add()
    return y
}

returnFifteen()

// Funcs are first class types 

func makeIncrementer() -> (Int -> Int) {
    func addOne(number:Int) -> Int {
        return 1 + number
    }
    
    return addOne
}

var increment = makeIncrementer()
increment(7)

// Function can take another function as one of its arguments
func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20,19, 2, 12]
hasAnyMatches(numbers, lessThanTen)

// Writing a colure without a name
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

// Or
var mappedNumbers = numbers.map({ number in 3 * number })
mappedNumbers

var sortedNumbers = sorted(numbers) { $0 < $1 }
sortedNumbers

/* Objects and Classes */

class Shape {
    var numberOfSides = 0
    func simpleDesc() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
println(shape.simpleDesc())

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name:String){
        self.name = name
    }
    
    func simpleDesc() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDesc() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my squarey square")
test.area()
test.simpleDesc()

// Getters and Setters

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get{
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDesc() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var tri = EquilateralTriangle(sideLength: 3.1, name: "a tri-tri-triangle")
tri.perimeter
tri.perimeter = 9.9
tri.sideLength

class TriangleAndSquare{
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var tas = TriangleAndSquare(size: 10, name: "test shape")
tas.square.sideLength
tas.triangle.sideLength
tas.square = Square(sideLength: 50, name: "large square")
tas.triangle.sideLength

class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int){
        count += amount * times
    }
}

var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
sideLength


/* Enumerations and Structures */
enum Rank: Int{
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDesc() -> String {
        switch self{
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue


func compareCards(first: Rank, second: Rank) -> Bool {
    return first.rawValue == second.rawValue
}

compareCards(Rank.Jack, Rank.Jack)
compareCards(Rank.Jack, Rank.Queen)

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDesc() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    func colour() -> String {
        switch self {
        case .Hearts, .Diamonds:
            return "red"
        case .Spades, .Clubs:
            return "black"
        default:
            return "joker"
        }
    }
}

let hearts = Suit.Hearts
let heartsDesc = hearts.simpleDesc()
let heartsColour = hearts.colour()

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDesc() -> String {
        return "The \(rank.simpleDesc()) of \(suit.simpleDesc()) "
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDes = threeOfSpades.simpleDesc()

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("0600", "1800")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise-Sunset = \(sunrise)-\(sunset)."
case let .Error(error):
    let serverResponse = "Failure ... \(error)"
}

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription : String = "A very simple class."
    var prop: Int = 90210
    func adjust() {
        simpleDescription += " Now with extra adjustmentness"
    }
}

var a = SimpleClass()
a.adjust()
let aDesc = a.simpleDescription

struct SimpleStruct: ExampleProtocol {
    var simpleDescription: String = "A simple struct"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStruct()
b.adjust()
let bDesc = b.simpleDescription

enum SimpleEnum : ExampleProtocol{
    case Base, Adjusted
    
    var simpleDescription: String {
        get {
            return self.getDescription()
        }
    }
    
    func getDescription() -> String{
        switch self{
        case Base:
            return "Simple"
        case .Adjusted:
            return "Adjusted"
        }
    }
    
    mutating func adjust() -> Void {
        self = SimpleEnum.Adjusted
    }
}

var c = SimpleEnum.Base
c.simpleDescription
c.adjust()
c.simpleDescription

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "the number \(self)"
    }
    
    mutating func adjust() {
        self = 42
    }
}

7.simpleDescription

protocol AbsVal {
    var absoluteValue: Double { get }
}

extension Double: AbsVal {
    var absoluteValue: Double {
        return Double.abs(self)
    }
}

(-23.23).absoluteValue

let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
