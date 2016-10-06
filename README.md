## Iterator Pattern in Swift
  * This pattern is commonly used in many language with an array or a collection of objects. It allows you to iterate sequentially
  over an aggregated object of objects without having to know how the collection is structed.
  * The iterator keep in memory the current item in the collection. It also calculate and predict the next object of the iteration.
  
## Implementation
  We define a simple *Player* class where we pass a string in the contructor which corresponding to the name of the player.
  ```swift
  class Player{
    var name : String!
    
    init(name : String){
        self.name = name
    }
  }
  ```
  
  * We create an object or struct that we will let us iterate over any class type. Here we define a struct that we call 
  *ObjectCollection*, where items are type *T*
  ```swift
  struct ObjectCollection<T>{
    let items : [T]
    var count: Int = 0
    init(items : [T]){
        self.items = items
    }
  }
  ```
  
  * We create an *extension* of *ObjectCollection* struct by tell that we want to implement the *Sequence* and *IteratorProtocol*
  
  ```swift
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
  ```
  
 * With Swift 3, if you want your type to act as its own iterator, you implement the requirement of *IteratorProtocol* protocol and declare conformance to both *Sequence* and *IteratorProtocol* protocol are suffient.
 
 ## Usage
 ```swift
 let player1 = Player(name: "Helmi")
 let player2 = Player(name: "Raphael")
 let player3 = Player(name: "Adrien")
 let player4 = Player(name: "Alain")

 let players = ObjectCollection(items:[player1,player2, player3,player4])

 for player in players{
     print("Name: \(player.name)")
 }
 ```
 
 
  
  
  
  
  
