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
        MemoryGame<String>(numberOfPairsOfCards: 12){pairIndex in
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
        model.choose(card)
    }
    
    // code to shuffle the cards
    
    func shuffle(){
        model.shuffle()
    }
    
    func restart(){
        model = EmojiMemoryGame.createMemoryGame()
        
    }
    
    
    
}

