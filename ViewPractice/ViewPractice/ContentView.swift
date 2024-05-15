//
//  ContentView.swift
//  ViewPractice
//
//  Created by Nazmul Haque Nahin on 14/5/24.
//

import SwiftUI

struct ContentView: View {
    
    
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
        VStack{
            ScrollView{
                LazyVGrid(columns:[GridItem(),GridItem(),GridItem()]){
                    
                    ForEach(emojis[0...counter],id: \.self){ emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3,contentMode: .fit)
                    }
                    
                }
            }
            .padding(.horizontal)
            .foregroundColor(.brown)
            // ---------------------------
    
            Spacer(minLength: 20)
            
            HStack{
                add
                Spacer()
                remove
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
    }
}


struct CardView : View {
    
    var content : String
    @State var isFaceUp : Bool = true
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3.0)
                Text(content).font(.largeTitle)
            }else{
                shape.fill().foregroundColor(.green)
            }
          
        }.onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}







#Preview {
    ContentView().preferredColorScheme(.dark)
}
