import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    @State private var dealt = Set<Int>()
    @Namespace private var dealingNamespace
    
    private struct CardConstants {
        static let color = Color.red
        static let aspectRatio: CGFloat = 2/3
        static let dealDuration: Double = 0.5
        static let totalDealDuration: Double = 2
        static let undealtHeight: CGFloat = 90
        static let undealtWidth: CGFloat = undealtHeight * aspectRatio
    }
    
    private func deal(_ card: EmojiMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    private func dealCards() {
        for (index, card) in game.cards.enumerated() {
            let delay = Double(index) * (CardConstants.totalDealDuration / Double(game.cards.count))
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation(.easeInOut(duration: CardConstants.dealDuration)) {
                    deal(card)
                }
            }
        }
    }
    
    private var bottomToTopTransition: AnyTransition {
        AnyTransition.asymmetric(
            insertion: AnyTransition.move(
                edge: .bottom).combined(with: .scale),
            removal: .opacity
        ).animation(Animation.smooth(duration: 1))
    }
    
    var gameBody: some View {
        AspectVGrid(
            items: game.cards,
            aspectRatio: 2/3,
            content: { card in
                if isUndealt(card) || (card.isMatched && !card.isFaceUp) {
                    Color.clear
                } else {
                    CardView(currentCard: card)
                        .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                        .padding(4)
                        .transition(bottomToTopTransition)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1)) {
                                game.choose(card)
                            }
                        }
                }
            }
        )
        .foregroundColor(CardConstants.color)
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(game.cards.filter(isUndealt)) { card in
                CardView(currentCard: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(
                        AnyTransition.asymmetric(
                            insertion: .opacity,
                            removal: .identity
                        )
                    )
            }
        }
        .frame(
            width: CardConstants.undealtWidth,
            height: CardConstants.undealtHeight
        )
        .foregroundColor(CardConstants.color)
        .onTapGesture {
            dealCards()
        }
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation(.easeInOut(duration: 1)) {
                game.shuffle()
            }
        }
    }
    
    var body: some View {
        VStack {
            gameBody
            deckBody
            shuffle
        }
    }
}

struct CardView: View {
    let currentCard: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
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
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFit: geometry.size))
            }
            .modifier(Cardify(isFaceUp: currentCard.isFaceUp))
        }
    }
    
    private func scale(thatFit size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.70
        static let fontSize: CGFloat = 32
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}
