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
  
  
