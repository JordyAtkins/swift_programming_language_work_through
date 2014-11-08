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