import Foundation

//შექმენით ციკლური რეფერენცები და გაწყვიტეთ

class Person {
    let name: String
    var car: Car?
    
    init(name: String, car: Car? = nil) {
        self.name = name
        self.car = car
    }
    deinit {
        print("\(name) - deinitialized")
    }
}

class Car {
    let name: String
    var owner: Person?
    
    init(name: String, owner: Person? = nil) {
        self.name = name
        self.owner = owner
    }
    deinit {
        print("Car, model - \(name) - deinitialized")
    }
}

var sandro: Person? = Person(name: "sandro", car: nil)
var BMW: Car? = Car(name: "BMW")

//პირველი ხერხი ორივე ერთდროულად გაწყვეტის
//BMW = nil
//sandro = nil
//მეორე ხერხი მანქანის გაწყვეტის
//sandro?.car = BMW
//BMW = nil
//sandro?.car =  nil
//მესამე ხერხი პერსონის გაწყვეტის
//BMW?.owner = sandro
//sandro = nil
//BMW?.owner = nil

// კლასი weak ცვლადით

class Person2 {
    let name: String
    var car: Car2?
    
    init(name: String, car: Car2? = nil) {
        self.name = name
        self.car = car
    }
    deinit {
        print("\(name) - deinitialized")
    }
}

class Car2 {
    let name: String
    weak var owner: Person2?
    
    init(name: String, owner: Person2? = nil) {
        self.name = name
        self.owner = owner
    }
    deinit {
        print("Car, model - \(name) - deinitialized")
    }
}

var sandroKK: Person2? = Person2(name: "sandroKK", car: nil)
var Maserati: Car2? = Car2(name: "Maserati")

Maserati?.owner = sandroKK
//sandroKK = nil

sandroKK?.car = Maserati
//Maserati = nil
//sandroKK?.car = nil

// struct ის გამოყენება

struct PersonalData {
    let name: String
}

struct CarData{
    let name: String
}

class Persson {
    var data: PersonalData
    var car: Caar?
    
    init(data: PersonalData, car: Caar? = nil) {
        self.data = data
        self.car = car
    }
    
    deinit{
        print("\(data.name) - deinitialized")
    }
}

class Caar {
    var data: CarData
    var owner: Persson?
    
    init(data: CarData, owner: Persson? = nil) {
        self.data = data
        self.owner = owner
    }
    
    deinit {
        print("\(data.name) - - deinitialized")
    }
}

let perssonName = PersonalData(name: "Sandrika")
let carName = CarData(name: "Ferrari")

var sandrika:Persson? = Persson(data: perssonName)
var Ferrari:Caar? = Caar(data: carName, owner: sandrika)

Ferrari?.owner = sandrika
//sandrika = nil
//Ferrari?.owner = nil

sandrika?.car = Ferrari
//
//Ferrari = nil
//sandrika?.car = nil

// პროტოკოლს დაქვემდებარებული კლასი, ქლოჟერით, unowned ცვლადით, self - ის დაჭერით

protocol Nameable {
    var name: String { get }
}

class Person1: Nameable {
    let name: String
    var car: Car1?
    
    init(name: String, car: Car1? = nil) {
        self.name = name
        self.car = car
    }
    deinit {
        print("\(name) - deinitialized")
    }
}

class Car1: Nameable {
    let name: String
    unowned var owner: Person1?
    lazy var printOwnerName: () -> Void = { [weak self] in
        guard let car = self,
              let owner = car.owner else { return }
        print("Owner's name is \(owner.name)")
    }
    
    init(name: String, owner: Person1?) {
        self.name = name
        self.owner = owner
    }
    deinit {
        print("Car, model - \(name) - deinitialized")
    }
}

var sandroK: Person1? = Person1(name: "sandroK")
var mercedes: Car1? = Car1(name: "Mercedes", owner: sandroK!)

sandroK?.car = mercedes

mercedes?.printOwnerName()

//mercedes = nil
//sandroK?.car = nil

//mercedes?.owner = sandroK
//sandroK = nil
