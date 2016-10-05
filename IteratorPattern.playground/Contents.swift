//: Playground - noun: a place where people can play

import UIKit

//class Player{
//    var name : String!
//    
//    init(name : String){
//        self.name = name
//    }
//}
//
//struct ObjectCollection<T>{
//    let items : [T]
//}
//
//extension ObjectCollection : SequenceType{
//    typealias Generator = AnyGenerator<T>
//    func generate() -> Generator {
//        var i = 0
//        return AnyGenerator {(i >= self.items.count) ? nil : self.items[i++]}
//    }
//}
//
//let player1 = Player(name: "Helmi")
//let player2 = Player(name: "Raphael")
//let player3 = Player(name: "Adrien")
//let player4 = Player(name: "Alain")
//
//let players = ObjectCollection(items:[player1,player2, player3,player4])
//
//for player in players{
//    print("Name: \(player.name)")
//}


class Player{
    var name : String!

    init(name : String){
        self.name = name
    }
}

struct ObjectCollection<T>:Sequence, IteratorProtocol{
    let items : [T]
    var count: Int = 0
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

let players = ObjectCollection(items:[player1,player2, player3,player4], count : 0)

for player in players{
    print("Name: \(player.name)")
}
