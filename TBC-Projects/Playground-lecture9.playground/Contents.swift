import Foundation

//შექმენით gender ინამი, პროტოკოლი SuperBeing თავისი ორი დიფოლტით, ორი კლასი, დამატებითი ფროფერთიზზ კლასებში, თითო კლასში ორი ფუნქცია, ბოლოს 5 სუპერგმირი, 5 ცუდი ტიპი.

enum Gender {
    case Male
    case Female
}

protocol SuperBeing {
    var name: String { get }
    var strength: Int { get }
    var speed: Int { get }
    var weakness: String { get }
    var gender: Gender { get }
}

extension SuperBeing {
    var strength: Int { 999 }
    var speed: Int { 360 }
}

class Superhero: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    
    init(name: String, weakness: String, gender: Gender) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
    }
}

class SuperVillain: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    
    init(name: String, weakness: String, gender: Gender) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
    }
}

extension Superhero {
    var outfitColor: String { "" }
    var equipment: String { "" }
    var vehicle: String { "" }
    
    func rescue(dazaralebuli: String) {
        print ("\(name) არ შეუშინდა სახიფათო სიტუაციას და \(dazaralebuli) გადაარჩინა სიკვდილს.")
    }
    func combat(mocinaagmdege: SuperVillain) {
        print("\(name) შეერკინა და დაამარცხა \(mocinaagmdege.name).")
    }
}

extension SuperVillain {
    var evilScheme: String { "" }
    var obsession: String { "" }
    var rivalry: String { "" }
    
    func attack(mocinaagmdege: Superhero) {
        print("\(name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(mocinaagmdege.name) მის შეჩერებას თუ შეძლებს.")
    }
    func experimentation(saeksperto: String) {
        print("\(name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად \(saeksperto) აღმოჩნდა.")
    }
}

// superheroes

let superman = Superhero(name: "Superman",
                         weakness: "Kryptonite",
                         gender: .Male)
let batman   = Superhero(name: "Batman",
                         weakness: "No superpowers",
                         gender: .Male)
let wonderWoman = Superhero(name: "Wonder Woman",
                         weakness: "maybe batman",
                         gender: .Female)
let spiderman   = Superhero(name: "Spiderman",
                         weakness: "Guilt",
                         gender: .Male)
let captainMarvel = Superhero(name: "Captain Marvel",
                         weakness: "Vulnerability to magic",
                         gender: .Female)

// supervillains

let joker = SuperVillain(name: "Joker",
                         weakness: "Obsession with Batman",
                         gender: .Male)
let thanos = SuperVillain(name: "Thanos",
                         weakness: "Ego",
                         gender: .Male)
let lexLuthor = SuperVillain(name: "Lex Luthor",
                         weakness: "Superman",
                         gender: .Male)
let catwoman = SuperVillain(name: "Catwoman",
                         weakness: "Batman",
                         gender: .Female)
let greenGoblin = SuperVillain(name: "Green Goblin",
                         weakness: "Insanity",
                         gender: .Male)

superman.rescue(dazaralebuli: "xalxi")

joker.attack(mocinaagmdege: superman)

superman.combat(mocinaagmdege: joker)

thanos.experimentation(saeksperto: "mars")
