//
//  MemoryGameModel.swift
//  MemoryGame
//
//  Created by Nazmul Haque Nahin on 16/5/24.
//


import Foundation

// ========== Model ============

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    private(set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyFacedUpCard: Int?
    
    mutating func choose(_ card : Card){
        
          // if chosenIndex is not nil
         // if let chosenIndex = index(of:card){
        //  cards[chosenIndex].isFaceUp.toggle()
       //}
        
  
        
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
             
            if let potentialMatchIndex = indexOfTheOneAndOnlyFacedUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched  = true
                }
                indexOfTheOneAndOnlyFacedUpCard = nil
            }else{
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFacedUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("chosen card = \(cards)")
        
    }
    

    
    init(numberOfPairsOfCards : Int,createCardContent:(Int)-> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content:content,id: pairIndex*2))
            cards.append(Card(content: content,id: pairIndex*2+1))
        }
    }
    
    // Card model
    struct Card : Identifiable{
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        var content : CardContent
        var id : Int
    }
    
}

