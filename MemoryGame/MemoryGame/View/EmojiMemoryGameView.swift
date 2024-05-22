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
    @State private var dealt = Set<Int>()
    @Namespace private var dealingNameSpace
    
    private struct CardConstants{
        static let color = Color.red
        static let aspectRatio : CGFloat = 2/3
        static let dealDuration : Double = 0.5
        static let totalDealDuration : Double = 2
        static let unDealtHeight  : CGFloat = 90
        static let unDealtWidth : CGFloat =  unDealtHeight * aspectRatio
    }
    
    
    
    
    
    private func deal(_ card : EmojiMemoryGame.Card){
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card : EmojiMemoryGame.Card) -> Bool{
        !dealt.contains(card.id)
    }
    
    
    // ======================================
    
    
    
    // code for game body view
    var gameBody : some View{
        AspectVGrid(
            items: game.card,
            aspectRatio: 2/3,
            content: { card in
                Group{
                    if isUndealt(card) || (card.isMatched && !card.isFaceUp) {
                        Color.clear
                    }else{
                        CardView(currentCard: card)
                        //.matchedGeometryEffect(id: card.id, in: dealingNameSpace)
                        .padding(4)
                        .transition(AnyTransition.asymmetric(
                            insertion: .scale,
                            removal: .opacity)
                            .animation(Animation.easeInOut(duration: 2))
                        )
                        
                        
                        .aspectRatio(CardConstants.aspectRatio,contentMode: .fit)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1)){
                                game.choose(card)
                            }
                        }
                    }
                }
            }
        )
        .padding(.horizontal)
        .foregroundColor(CardConstants.color)
    }
 
    
    
    var deckBody: some View{
        ZStack{
            ForEach(game.card.filter(isUndealt)){ card in
                CardView(currentCard: card)
                    .transition(
                        AnyTransition.asymmetric(
                            insertion: .opacity,
                            removal: .scale
                        )
                    )
            }
        }
        .frame(width:CardConstants.unDealtWidth,height: CardConstants.unDealtHeight)
        .foregroundColor(CardConstants.color)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 5)){
                for card in game.card{
                    deal(card)
                }
            }
        }
    }
    
    
    // code for shuffle cards
    
    var shuffle : some View{
        Button("Shuffle"){
            withAnimation(.easeInOut(duration: 1)){
                game.shuffle()
            }
        }
    }
    
    
    
    
    var body: some View {
        
        VStack{
            gameBody
            deckBody
            shuffle
        }
        
    }
}




// -------------- card view ------------------
struct CardView : View {
    let currentCard : EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Pie(
                    startAngle: Angle(degrees: 0-90),
                    endAngle: Angle(degrees: 110-90)
                )
                .opacity(0.5)
                .padding(5)
                
                Text(currentCard.content)
                .rotationEffect(Angle.degrees(currentCard.isMatched ? 360 : 0))
                .animation(
                    Animation.easeInOut.speed(0.8)
                    .repeatForever(autoreverses: false),
                    value: UUID()
                )
                .font(Font.system(size:DrawingConstants.fontSize))
                .scaleEffect(scale(thatFit: geometry.size))
            }.modifier(Cardify(isFaceUp: currentCard.isFaceUp))
        }
    }
    
    
    private func scale(thatFit size : CGSize) -> CGFloat{
        min(size.width,size.height) / (DrawingConstants.fontSize/DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants{
        static let cornerRadius:CGFloat = 10
        static let lineWidth:CGFloat = 3
        static let fontScale:CGFloat = 0.70
        static let fontSize:CGFloat = 32
    }
}


// code for instant preiew

struct ContentView_Previews : PreviewProvider{
    static var previews: some View{
        
        let game = EmojiMemoryGame()
        //game.choose(game.card.first!)
        return EmojiMemoryGameView(game: game)
        //.preferredColorScheme(.light)
    }
}





