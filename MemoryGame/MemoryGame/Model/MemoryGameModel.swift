//
//  MemoryGameModel.swift
//  MemoryGame
//
//  Created by Nazmul Haque Nahin on 16/5/24.
//


import Foundation

// ========== Model ============

struct MemoryGame<CardContent>{
    
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card : Card){
        
        let chosenIndex = index(of:card)
        cards[chosenIndex].isFaceUp.toggle()
        print("chosen card = \(cards)")
        
    }
    
    func index(of card : Card) -> Int {
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        
        return 0
    }
    
    init(numberOfPairsOfCards : Int,createCardContent:(Int)-> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content:content,id: pairIndex))
            //cards.append(Card(content: content,id: pairIndex*2+1))
        }
    }
    
    // Card model
    struct Card : Identifiable{
        var isFaceUp : Bool = true
        var isMatched : Bool = false
        var content : CardContent
        var id : Int
    }
    
}

