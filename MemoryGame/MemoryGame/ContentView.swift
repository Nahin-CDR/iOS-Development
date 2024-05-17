//
//  ContentView.swift
//  MemoryGame
//
//  Created by Nazmul Haque Nahin on 16/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var emojis = ["🍔","🌽","🍩","🍝","🍗","🍕","🥙","🥞"]
    
    @State var counter : Int = 2
    
    var remove : some View{
        Button(action: {
            if counter>0 {
                counter -= 1
            }
            
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    
    
    var add : some View{
        Button(action: {
            if counter<7 {
                counter += 1
            }
            
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns:[GridItem(.adaptive(minimum:70))]){
                
                ForEach(viewModel.card){ card in
                    CardView(card:card)
                        .aspectRatio(2/3,contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
                
            }
        }
        .padding(.horizontal)
        .foregroundColor(.brown)
        // ---------------------------
    }
}




// -------------- card view ------------------
struct CardView : View {
    let card : MemoryGame<String>.Card
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
              // shape.stroke(lineWidth: 3.0)
                Text(card.content).font(.largeTitle)
            }else if card.isMatched {
                shape.opacity(0)
            }
            else{
                shape.fill()
                    .foregroundColor(.green)
              //  shape.stroke(lineWidth: 3.0)
            }
          
        }
    }
}


// code for instant preiew

struct ContentView_Previews : PreviewProvider{
    static var previews: some View{
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}





