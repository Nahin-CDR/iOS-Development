//
//  ContentView.swift
//  MemoryGame
//
//  Created by Nazmul Haque Nahin on 16/5/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    // game is a viewModel here
    @ObservedObject var game : EmojiMemoryGame
    
   
 
    
    
    var body: some View {
        
            AspectVGrid(
                items: game.card,
                aspectRatio: 2/3,
                content: { card in
                    CardView(currentCard: card)
                    .padding(4)
                    .aspectRatio(2/3,contentMode: .fit)
                    .onTapGesture {
                        game.choose(card)
                    }
                }
            )
        
 //       ScrollView{
//            LazyVGrid(columns:[GridItem(.adaptive(minimum:100))]){
//                ForEach(game.card){ card in
//                    CardView(
//                        currentCard: card
//                    )
//                    .aspectRatio(2/3,contentMode: .fit)
//                    .onTapGesture {
//                        game.choose(card)
//                    }
//                }
//                
//            }
 //       }
        .padding(.horizontal)
        .foregroundColor(.brown)
    }
}




// -------------- card view ------------------
struct CardView : View {
    let currentCard : EmojiMemoryGame.Card
    
//    init(_ givenCard: EmojiMemoryGame.Card) {
//        self.card = givenCard
//    }
    
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                let shape = RoundedRectangle(
                    cornerRadius: DrawingConstants.cornerRadius
                )
                if currentCard.isFaceUp{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(
                        currentCard.content
                    ).font(
                        Font.system(
                            size:min(
                                geometry.size.width,
                                geometry.size.height
                            )*DrawingConstants.fontScale
                        )
                    )
                }else if currentCard.isMatched {
                    shape.opacity(0)
                }
                else{
                    shape.fill().foregroundColor(.gray)
                }
              
            }
        }
    }
    
    private struct DrawingConstants{
        static let cornerRadius:CGFloat = 10
        static let lineWidth:CGFloat = 3
        static let fontScale:CGFloat = 0.75
    }
}


// code for instant preiew

struct ContentView_Previews : PreviewProvider{
    static var previews: some View{
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
    }
}





