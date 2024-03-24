import Foundation
//1. შევქმნათ Class Book.
//Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
//Designated Init.

class Book {
    var author: String
    var title: String
    var bookID: Int
    var isBorrowed = false
    init(author: String, title: String, bookID: Int, isBorrowed: Bool = true) {
        self.author = author
        self.title = title
        self.bookID = bookID
        self.isBorrowed = isBorrowed
    }
    //Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
    
    func markBorrowed() {
        isBorrowed = true
        print("\(title) -  borrowed ")
    }
    //Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.
    
    func markReturned () {
        isBorrowed = false
        print("\(title) - returned ")
    }
}
//let myFavoriteBook = Book(author: "Mikheil Javakhishvili", title: "The White Collar", bookID: 1926, isBorrowed: false)

//2. შევქმნათ Class Owner
//Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
//Designated Init.

class Owner {
    var ownerId:Int
    var name: String
    var borrowedBooks: [Book]
    init(ownerId: Int, name: String, borrowedBooks: [Book]) {
        self.ownerId = ownerId
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    //Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
    
    func borrowBook(book: Book) {
        var isBorrowed = false
        book.markBorrowed()
        borrowedBooks.append(book)
    }
    //Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.
    
    func returnBook(book: Book) {
        if let element = borrowedBooks.firstIndex(where: { $0.bookID == book.bookID }) {
            book.markReturned()
            borrowedBooks.remove(at: element)
        }
    }
}

//let book1 = Book(author: "Chabua Amirejibi", title: "Data Tutashkhia", bookID: 1975, isBorrowed: true)
//let book2 = Book(author: "Aka Morchiladze", title: "Paliashvili Street Dogs", bookID: 2017, isBorrowed: false)
//let book3 = Book(author: "Guram Dochanashvili ", title: "The man, who very loved the literature", bookID: 2001, isBorrowed: false)
//
//let sandroK = Owner(ownerId: 200126, name: "Sandro", borrowedBooks: [book1])

//sandroK.borrowBook(book: book2)
//sandroK.borrowBook(book: book3)
//print(sandroK.borrowedBooks.map{$0.title})
//sandroK.returnBook(book: book1)
//print(sandroK.borrowedBooks.map{$0.title})

//3. შევქმნათ Class Library
//Properties: Books Array, Owners Array.
//Designated Init.

class Library {
    var BooksArray: [Book]
    var OwnersArray: [Owner]
    init(BooksArray: [Book], OwnersArray: [Owner]) {
        self.BooksArray = BooksArray
        self.OwnersArray = OwnersArray
    }
    //Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
    
    func addnewBook(book: Book) {
        BooksArray.append(book)
    }
    //Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
    
    func addnewOwner(owner: Owner) {
        OwnersArray.append(owner)
    }
    //Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
    
    func getAvailableBooks() -> [Book] {
        var availableBooks: [Book] = []
        for book in BooksArray {
            if !book.isBorrowed {
                availableBooks.append(book)
            }
        }
        return availableBooks
    }
    //Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
    
    func getUnAvailableBooks() -> [Book] {
        var uAavailablebooks: [Book] = []
        for unbook in BooksArray {
            if unbook.isBorrowed {
                uAavailablebooks.append(unbook)
            }
        }
        return uAavailablebooks
    }
    //Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
    
    func findOwnerByID(ownerId: Int) -> Owner? {
        for owner in OwnersArray {
            if owner.ownerId == ownerId {
                return owner
            }
        }
        return nil
    }
    //Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
    
    func findBookByOwner(owner: Owner) -> [String]{
        var borrowedBookTitles: [String] = []
        for book in owner.borrowedBooks {
            borrowedBookTitles.append(book.title)
        }
        return borrowedBookTitles
    }
    //Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.
    
    func borrowBookIfFree(owner: Owner, book: Book) {
        guard !book.isBorrowed else {
            return
        }
        book.markBorrowed()
        owner.borrowedBooks.append(book)
    }
}

//გავაკეთოთ ბიბლიოთეკის სიმულაცია.
//
//შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
//დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
//წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
//დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.

let book1 = Book(author: "Chabua Amirejibi",       title: "Data Tutashkhia",
                 bookID: 1975, isBorrowed: false)
let book2 = Book(author: "Aka Morchiladze",        title: "Paliashvili Street Dogs",
                 bookID: 2017, isBorrowed: false)
let book3 = Book(author: "Guram Dochanashvili ",   title: "The man, who very loved the literature",
                 bookID: 2001, isBorrowed: false)
let book4 = Book(author: "Mikheil Javakhishvili",  title: "The White Collar",
                 bookID: 1926, isBorrowed: false)

let sandroK = Owner(ownerId: 200126, name: "Sandro", borrowedBooks: [book1])
let vacheK  = Owner(ownerId: 201905, name: "Vache",  borrowedBooks: [book2])
let liziK   = Owner(ownerId: 200520, name: "Lizi",   borrowedBooks: [book3])

let samkitxvelo = Library(BooksArray: [book1, book2, book3, book4],
                          OwnersArray: [sandroK, vacheK, liziK])

//დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
let book5 = Book(author: "Vazha-Pshavela",       title: "Host and Guest",
                 bookID: 1893, isBorrowed: false)
samkitxvelo.addnewBook(book: book5)
print(samkitxvelo.BooksArray.map{$0.title})

let davitK = Owner(ownerId: 197631, name: "Davit", borrowedBooks: [book1])
samkitxvelo.addnewOwner(owner: davitK)
print(samkitxvelo.OwnersArray.map{$0.name})

//წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.

sandroK.borrowBook(book: book4)
print(sandroK.borrowedBooks.map{$0.title})
sandroK.borrowBook(book: book2)
print(sandroK.borrowedBooks.map{$0.title})
sandroK.returnBook(book: book1)
print(sandroK.borrowedBooks.map{$0.title})
vacheK.borrowBook(book: book5)
liziK.borrowBook(book: book3)
//დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.

let cagebulebi = samkitxvelo.getUnAvailableBooks()
print(cagebulebi.map{$0.title})

let tavisuplebi = samkitxvelo.getAvailableBooks()
print(tavisuplebi.map{$0.title})

if let davitK = samkitxvelo.OwnersArray.first(where: { $0.ownerId == 197631 }) {
    let borrowedBookTitles = samkitxvelo.findBookByOwner(owner: davitK)
    for title in borrowedBookTitles {
        print(" \(title)")
    }
}



