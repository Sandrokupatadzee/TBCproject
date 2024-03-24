import Foundation
//1. შექმენით სამი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი ნამრავლი.

var number1: Int = 5
var number2: Int = 3
var number3: Int = 4
var final = number1 * number2 * number3
print (final)

//2. შექმენით int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა და შეამოწმეთ ეს რიცხვი ლუწია თუ კენტი ტერნარი ოპერატორით.

var number4: Int = 7
var final2 : Int = number4 % 2
print (final2)
print (final2 == 0 ? "ეს ცვლადი ლუწია" : "ეს ცვლადი კენტია")

//3. შექმენით optional String-ის ტიპის და მიანიჭეთ თქვენი სახელის მნიშვნელობა. If let-ის მეშვეობით გაუკეთეთ unwrap და მნიშვნელობა დაპრინტეთ

var myName: String? = "sandro"
if let myName = myName {
       print   (myName)
}

//4. შექმენით ცვლადი სახელად isRaining ბულეანის ტიპის და მიანიჭეთ თქვენთვის სასურველი მნიშვნელობა. If-else-ის მეშვეობით შეამოწმეთ თუ მნიშვნელობა მიიღებს true მნიშვნელობას დაბეჭდეთ “ქოლგის წაღება არ დამავიწყდეს”, სხვა შემთხვევაში “დღეს ქოლგა არ დამჭირდება”.

var isRaining =  false
if  isRaining == true {
    print ("ქოლგის წაღება არ დამავიწყდეს")
}   else  {
    print ("დღეს ქოლგა არ დამჭირდება")
}

//5. შექმენით ორი int ტიპის ცვლადი a & b და მიანიჭეთ სასურველი რიცხვები. If-else-ით შეამოწმეთ თუ a მეტია b-ზე დაბეჭდეთ “a მეტია”,  სხვა შემთხვევაში “b მეტია”

var numberA: Int = 16
var numberB: Int = 15
if numberA > numberB {
    print ("A მეტია")
}   else {
    print("B მეტია")
}

//6. შექმენით მუდმივა Character ტიპის და მიანიჭეთ თქვენი სახელის პირველი ასოს მნიშვნელობა.

let myNameFirstLetter: Character = "S"
print (myNameFirstLetter)

//7. მოცემულია ორნიშნა რიცხვი, გაიგეთ არის თუ არა ერთიდაიმავე ციფრებისგან შემდგარი

let firstNumber : Int = 8
let secondNumber: Int = 8
var targetNumber = String (firstNumber) + String (secondNumber)
print (firstNumber==secondNumber ? "ერთიდაიმავე ციფრებისგანაა შემდგარი" : "განსხვავებული ციფრებისგანაა შემდგარი")

//8. აიღეთ ცვლადი numberOfMonths მიანიჭეთ მნიშვნელობა და იმის მიხედვით თუ მერამდენე თვეა დაბეჭდეთ ის (გაზაფხული, ზაფხული, შემოდგომა, ზამთარი) შესაბამისად.

var numberOfMonths: String? = "12"
if numberOfMonths == "3" || numberOfMonths == "4" || numberOfMonths == "5" {
    print ("ახლა გაზაფხულია")
} else if numberOfMonths == "6"  || numberOfMonths == "7"  || numberOfMonths == "8"  {
    print ("ახლა ზაფხულია")
} else if numberOfMonths == "9"  || numberOfMonths == "10" || numberOfMonths == "11" {
    print ("ახლა შემოდგომაა")
} else if numberOfMonths == "12" || numberOfMonths == "1"  || numberOfMonths == "2"  {
    print ("ახლა ზამთარია")
}

//9. შექმენით მთელი რიცხვის მქონე ცვლადი. თუ ეს ცვლადი იყოფა 3-ზე, დაბეჭდეთ “იყოფა 3-ზე”, თუ ეს ცვლადი იყოფა 4-ზე დაბეჭდეთ “იყოფა 4-ზე”, თუ იყოფა ორივეზე დაბეჭდეთ “იყოფა 3-ზე და 4-ზე”

var targetNumber2: Int = 8
var finalTHREE: Int = targetNumber2 % 3
var finalFOUR : Int = targetNumber2 % 4
if finalTHREE == 0 && finalFOUR == 0 {
    print ("იყოფა 3-ზე და 4-ზე")
} else if finalTHREE == 0 && finalFOUR > 0 {
    print ("იყოფა 3-ზე")
} else if finalTHREE > 0 && finalFOUR == 0 {
    print ("იყოფა 4-ზე")
}

// 10. შექმენით ორი რიცხვითი ცვლადი num1, num2 და რაიმე String ტიპის ცვლადი რომელსაც ტერნარული ოპერატორის საშუალებით მიანიჭებთ “თანაბრად დაშორებულია ნულიდან” / “არ არის თანაბრად დაშორებული ნულიდან” შესაბამის მნიშვნელობას რომელსაც აკმაყოფილებს მოცემული ორი ცვლადი

var num1: Int = 5
var num2: Int = -5
print (num1 == num2 || num1 == -num2 || -num1 == num2 ? "თანაბრად დაშორებულია ნულიდან" : "არ არის თანაბრად დაშორებული ნულიდან")
