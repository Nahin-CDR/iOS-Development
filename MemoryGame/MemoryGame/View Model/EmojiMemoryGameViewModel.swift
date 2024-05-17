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
    
    static var emojis = ["🍔","🌽","🍩","🍝","🍗","🍕","🥙","🥞","🚗","🎲","🏖️","🍟","🚀"]
    
    
    static func createMemoryGame() -> MemoryGame<String>{
      return MemoryGame(numberOfPairsOfCards: 8){index in
          emojis[index]
      }
    }
    
    @Published private var model : MemoryGame<String> = createMemoryGame()
    
    var card : Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    
    
    // MARK - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
       // objectWillChange.send()
        model.choose(card)
    }
}

