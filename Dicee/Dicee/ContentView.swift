//
//  ContentView.swift
//  Dicee
//
//  Created by Nazmul Haque Nahin on 11/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDice = 1
    @State var rightDice = 1
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Image("diceeLogo")
                Spacer()
                HStack{
                    DiceView(n: leftDice)
                    DiceView(n: rightDice)
                }
                .padding(.horizontal)
                Spacer()
                AwesomeButton{
                    self.leftDice = Int.random(in: 1...6)
                    self.rightDice = Int.random(in: 1...6)
                }
            }.padding(EdgeInsets(top: 4, leading: 9, bottom: 8, trailing: 4))
        }
    }
}


struct DiceView : View {
    let n : Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}






struct AwesomeButton: View {
    // Define a callback closure that takes no parameters and returns Void
    var onTap: () -> Void
    
    var body: some View {
        Button(action: {
            // Call the onTap closure when the button is tapped
            onTap()
        }) {
            Text("Roll")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.brown)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 0, y: 2)
        }
    }
}




#Preview {
    ContentView()
}
