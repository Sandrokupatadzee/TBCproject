import Foundation

//while ციკლის გამოყენებით, 1-დან 50-მდე დაბეჭდეთ ყველა კენტი რიცხვის ნამრავლი.

let numbersRange = 1...50
var currentOdd   = 1
var result       = 1

while currentOdd <= 49 {
      result *= currentOdd
      currentOdd += 2
}

//შექმენით String ტიპის ცვლადი და ციკლის გამოყენებით შემოაბრუნეთ ის, მაგ: თუ გვაქვს “Test” უნდა მივიღოთ “tseT”

var name = "LOSPOLLOSHERMANOS"

func reverse(mustBeReversed: String) -> String {
    var alreadyReversed = ""
    for charachter in mustBeReversed {
        alreadyReversed = "\(charachter)" + alreadyReversed
    }
    return alreadyReversed
}
reverse (mustBeReversed: name)

//while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."
// switch statement-ში default ჩავაკომენტარე რო არ დაექრაშა...
var trafficLight: [String] = ["🔴" , "🌕" , "🟢"]
var currentLight = 0

while true {
    let color = trafficLight[currentLight]
    switch color {
    case "🔴":
        print("🔴")
    case "🌕":
        print("🌕")
    case "🟢":
        print("🟢")
    default:
        break
    }
    currentLight = (currentLight + 1) % trafficLight.count
}

//Taylor Swift-ის კონცერტის ბილეთები იყიდება, თუმცა რაოდენობა ძალიან შეზღუდულია. While loop-ის მეშვეობით შექმენით ბილეთების გაყიდვის სიმულაცია და ყოველ გაყიდულ ბილეთზე დაბეჭდეთ “ბილეთი გაყიდულია, დარჩენილია მხოლოდ X რაოდენობა”, მანამ სანამ ბილეთების რაოდენობა მიაღწევს 0-ს, რის შემდეგაც ბეჭდავთ - “ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე”

var availableTicket = 50
var customerNumber  = 1

while availableTicket  > 0 {
      availableTicket -= 1
    print("ბილეთი გაყიდულია, დარჩენილია მხოლოდ \(availableTicket) რაოდენობა.")
    customerNumber += 1
    if availableTicket == 0 {
    print("ყველა ბილეთი გაყიდულია, გელოდებით კონცერტზე!")
    }
}

//შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)

var universityGrades: [Int] = [ 100, 100, 95, 99, 81, 94, 85]
var duplicatesDetected = false

for grade1 in 0..<universityGrades.count {
    for grade2 in (grade1 + 1)..<universityGrades.count {
    if universityGrades[grade1] == universityGrades[grade2] {
       duplicatesDetected = true
    break
    }
    }
}

if duplicatesDetected {
    print("array შეიცავს მსგავს ელემენტებს.")
} else {
    print("array-ში ყველა ელემენტი განსხვავებულია.")
}

//დაწერეთ ქლოჟერი რომელიც გამოითვლის ორი რიცხვის სხვაობას და დააბრუნებს მიღებულ მნიშვნელობას

let minusClosure = { (number1: Double, number2: Double) in
    return ((number1) - (number2))
}
minusClosure(10,4.1)

//დაწერეთ ფუნქცია, რომელსაც გადააწვდით String ტიპის პარამეტრს. დაითვალეთ ამ პარამეტრში თანხმოვნების რაოდენობა და დაბეჭდეთ ის.

let targetWord:String = "LOSPOLLOSHERMANOS"
let charactersToCount: [Character] = ["B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z"]

func counting(mustBeCount: String) -> Int {
    var consonantsCount = 0
    for character in targetWord {
    if  charactersToCount.contains(character) {
        consonantsCount += 1
    }
    }
    return consonantsCount
}

let consonantCount = counting(mustBeCount: targetWord)
print("თანხმოვნების რაოდენობა სიტყვაში - \(targetWord) შეადგენს \(consonantCount) -ს")

//შექმენით ორი Int-ების array, შეავსეთ პირველი array 8, 4, 9, 9, 0, 2, და მეორე array 1, 0, 9, 2, 3, 7, 0, 1 ამ რიცხვებით. გააერთიანეთ ეს ორი array ერთ დასორტილ array-ში, ანუ შედეგი უნდა მიიღოთ ასეთი: 0, 0, 0, 1, 1, 2, 2, 3, 4, 7, 8, 9, 9, არ გამოიყენოთ sorted() ან რაიმე სხვა უკვე არსებული მეთოდი swift-იდან. დაბეჭდეთ მიღებული დასორტილი array.

let firstArray:   [Int] = [8, 4, 9, 9, 0, 2]
let secondArray:  [Int] = [ 1, 0, 9, 2, 3, 7, 0, 1 ]

func merge(first: [Int], second: [Int]) -> [Int] {
    var mergedArray = first
    for character in second {
        mergedArray.append(character)
    }
    return mergedArray
}

let merged = merge(first: firstArray, second: secondArray)
print(merged)











































