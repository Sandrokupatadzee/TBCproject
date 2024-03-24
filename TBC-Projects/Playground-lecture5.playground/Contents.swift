import Foundation

//დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”)

var Word = "ana"

func mirrorCheck(mirrorWord: String) -> Bool {
    let reversedWord = String(mirrorWord.reversed())
    return reversedWord == mirrorWord
}

print(mirrorCheck(mirrorWord: Word))
//
////დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.
//
//var numberList: [Int] = [1,2,3,4,5,6,7,8,9]
//var squareNumberList: [Int] = []
//func multiple(targetArray: [Int]) -> [Int] {
//    for character in numberList {
//        let result = character * character
//        squareNumberList.append(result)
//    }
//    return squareNumberList
//}
//print(multiple(targetArray: numberList))
//
////დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.
//
//var numbersList: [Int] = [1,2,3,4,5,6,7,8,9]
//var evenNumbersList: [Int] = []
//let evenClosure = {
//    for number in numbersList {
//        if number % 2 == 0 {
//            evenNumbersList.append(number)
//        }
//    }
//    return evenNumbersList
//}
//
//print(evenClosure())

//დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.

let numbersParameter: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 5]

let myClosure: ([Int]) -> Void = { firstArray in
    var sum: Int = 0
    for number in firstArray {
        sum += number
    }
    print("Sum:", sum)
}

func sumOfArray(array: [Int], sumClosure: @escaping (([Int]) -> Void)) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
        sumClosure(array)
    }
}

sumOfArray(array: numbersParameter, sumClosure: myClosure)

//შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი

var goats: [String: Int] = [
    "BB King": 433300300,
    "John Coltrane": 433300301,
    "Miles Davis": 433300302,
    "Sade": 433300303,
    "Randy Crawford": 433300304
]

// ვამატებ კონტაქტს
goats["Charlie Parker"] = 433300305

// ვპრინტავ კონკრეტული Key-ს შესაბამის Value-ს
print (goats["Charlie Parker", default: 0])
print(goats["BB King", default: 0])

// კონკრეტული Key-თვის ვშლი Value-ს ( ჩვენს შემთხვევაში Dictionary-დან ვშლი კონტაქტს )
goats.removeValue(forKey: "Sade")
print(goats)

// Dictionary-დაბ ვშლი კონტაქტს კონკრეტული Value-ს nil-თან გატოლებით
goats["Randy Crawford"] = nil
print(goats)


//დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.

let grades: [String: Int] = [
    "sandro": 100,
    "luka": 99,
    "vako": 95
]

func alphabetKey(parameter1: [String: Int]) -> [String] {
    let keysArray = parameter1.keys.sorted()
    return keysArray
}

let keys = alphabetKey(parameter1: grades)
print(keys)


//შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.

let temperatures: [Double] = [3.14, 2.5, 32.5, 54.5, 4.6]
var maxTemperature = temperatures[0]

for temperature in temperatures {
    if temperature > maxTemperature {
        maxTemperature = temperature
    }
}
print(maxTemperature)


//დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიღერების ჯამურ ხანგრძლივობას წუთებში და წამებში

let lelaWhatMovementIsThis: [String: Int] = [
    "ღამის “სიჩუმე გაფანტე": 235,
    "ვიხსენებ ყველაფერს თავიდან": 219,
    "სულელი წვიმა": 231,
    "ალალ მე": 231,
    "იდუმალი ღამე": 221,
    "ჩუმად ნათქვამი": 199,
    "თეთრი ქარავანი": 221,
    "ძველი ვერხვები": 193
]

func sumValue(parameter1: [String: Int]) -> Void {
    var sum: Int = 0
    for character in parameter1.values {
        sum += character
    }
    let minutes = sum / 60
    let seconds = sum % 60
    print("ლელას სიმღერები ჯამში შეადგენს \(minutes) წუთს და \(seconds) წამს")
}

sumValue(parameter1: lelaWhatMovementIsThis)


//დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.

let lelasWhatMovementIsThis: [String: Int] = [
    
    "ღამის სიჩუმე გაფანტე": 235,
    "ვიხსენებ ყველაფერს თავიდან": 219,
    "სულელი წვიმა": 231,
    "ალალ მე": 231,
    "იდუმალი ღამე": 221,
    "ჩუმად ნათქვამი": 199,
    "თეთრი ქარავანი": 221,
    "ძველი ვერხვები": 193
]

func timingValues(parameter1: [String: Int]) {
    let longestMusic = parameter1.values.max()
    let shortestMusic = parameter1.values.min()
    var longestMusicTitle: [String] = []
    var shortestMusicTitle: [String] = []
    for (name, duration) in parameter1 {
        if duration == longestMusic {
            longestMusicTitle.append(name)
        }
        if duration == shortestMusic {
            shortestMusicTitle.append(name)
        }
    }
        for title in longestMusicTitle {
            print("\(title)")
        }
        
        for title in shortestMusicTitle {
            print("\(title)")
        }
    }

    timingValues(parameter1: lelasWhatMovementIsThis)
