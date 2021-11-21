import UIKit

var greeting = "Hello, playground"


//Structs
let val = "true"

let valStr = val.map { char in
    return char
}
print(valStr)

struct Employee {
    var name: String
    var vacationRemaining : Int
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I am going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops not enough days remaining")
        }
    }
}

var james = Employee(name: "James Bond", vacationRemaining: 12)
james.takeVacation(days: 5)
print(james.vacationRemaining)


//Compute property
 
struct NewEmployee {
    var vacationAllocated = 14
    var vacationTaken = 0
    let name : String
    var vacationRemaining : Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var singham = NewEmployee(name: "Singham")

singham.vacationTaken = 4

print(singham.vacationRemaining)
singham.vacationTaken = 2
print(singham.vacationRemaining)
singham.vacationRemaining = 2
print(singham.vacationRemaining)


//property observers -didset willset

struct Game {
    var score: Int {
        didSet {
            print("The score is \(score)")
        }
    }
    
}

var newGame = Game(score: 10)
newGame.score += 10
newGame.score += 20
newGame.score -= 5

struct App {
    var name = [String]() {
        willSet {
            print("The values is being set")
            print("The new value is \(newValue)")
        }
        didSet {
            print("The values are set")
            print("The old value is \(oldValue)")
        }
    }
}
print("==============")
var newApp = App()
newApp.name.append("Mohsin")
newApp.name.append("Kosha")
newApp.name.append("Hardik")

//Custom initialisers

struct Player {
    var name: String
    var number: Int
    
    init(name: String){
        self.name = name
        self.number = Int.random(in: 1 ... 99)
    }
}

let newPlayer = Player(name: "Bukayo Saka")
print(newPlayer.number)
