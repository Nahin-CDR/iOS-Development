//
//  EmojiMemoryGameViewModel.swift
//  MemoryGame
//
//  Created by Nazmul Haque Nahin on 16/5/24.
//


// -------- view model ---------------




//func makeCardContent( index:Int ) -> String{
//    return "🔥"
//}

import SwiftUI

class EmojiMemoryGame : ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static var emojis = ["🍔","✈️","🌽","🍩","🍝","🍗","🍕","🥙","🥞","🚗","🎲","🏖️","🍟","🚀"]
    
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 5){pairIndex in
          emojis[pairIndex]
      }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards : Array<Card>{
        return model.cards
    }
    
    
    
    // MARK - Intent(s)
    
    func choose(_ card: Card){
        objectWillChange.send()
        let res:Bool = model.choose(card)
        if res == true{
            increaseCounter()
        }
    }
    
    // code to shuffle the cards
    
    func shuffle(){
        model.shuffle()
    }
    
    func restart(){
        model = EmojiMemoryGame.createMemoryGame()
        resetSuccessCounter()
    }
    
   @Published var successCounter: Int = 0
   
   func increaseCounter(){
       successCounter += 1
       objectWillChange.send()
   }
   func resetSuccessCounter(){
       successCounter = 0
       objectWillChange.send()
   }
   
    
}

