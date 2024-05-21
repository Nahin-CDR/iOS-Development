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
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                    .padding(5)
                
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
            }.modifier(Cardify(isFaceUp: currentCard.isFaceUp))
        }
    }
    
    private struct DrawingConstants{
        static let cornerRadius:CGFloat = 10
        static let lineWidth:CGFloat = 3
        static let fontScale:CGFloat = 0.70
    }
}


// code for instant preiew

struct ContentView_Previews : PreviewProvider{
    static var previews: some View{
        
        let game = EmojiMemoryGame()
        game.choose(game.card.first!)
        return EmojiMemoryGameView(game: game)
    //        .preferredColorScheme(.light)
    }
}





