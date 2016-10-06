//: Playground - noun: a place where people can play

import UIKit

class Player{
    var name : String!

    init(name : String){
        self.name = name
    }
}


// Swift 2

//struct ObjectCollection<T>{
//    let items : [T]
//}
//extension ObjectCollection : SequenceType{
//    typealias Generator = AnyGenerator<T>
//    func generate() -> Generator {
//        var i = 0
//        return AnyGenerator {(i >= self.items.count) ? nil : self.items[i++]}
//    }
//}


// Swift 3
struct ObjectCollection<T>{
    let items : [T]
    var count: Int = 0
    init(items : [T]){
        self.items = items
    }
}

extension ObjectCollection:Sequence, IteratorProtocol{
    
    mutating func next() -> T? {
        
        if count >= self.items.count {
            return nil
        } else {
            defer { count = count + 1 }
            return items[count]
        }
    }
}

let player1 = Player(name: "Helmi")
let player2 = Player(name: "Raphael")
let player3 = Player(name: "Adrien")
let player4 = Player(name: "Alain")

let players = ObjectCollection(items:[player1,player2, player3,player4])

for player in players{
    print("Name: \(player.name)")
}
