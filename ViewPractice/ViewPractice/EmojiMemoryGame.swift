//
//  EmojiMemoryGame.swift
//  ViewPractice
//
//  Created by Nazmul Haque Nahin on 15/5/24.
//

import SwiftUI

// -------- view model ---------------




func makeCardContent( index:Int ) -> String{
    return "🔥"
}

class EmojiMemoryGame{
    
    static var emojis = ["🍔","🌽","🍩","🍝","🍗","🍕","🥙","🥞"]
    
    
    static func createMemoryGame() -> MemoryGame<String>{
      return MemoryGame(numberOfPairsOfCards: 4){index in
          emojis[index]
      }
    }
    
    private var model : MemoryGame<String> = createMemoryGame()
    
    var card : Array<MemoryGame<String>.Card>{
        return model.cards
    }
}
