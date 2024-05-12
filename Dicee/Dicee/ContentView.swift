import SwiftUI

struct ContentView: View {
    
    @State var leftDice = 1
    @State var rightDice = 1
    @State var isRolling = false // Track whether rolling animation is in progress
    @State var isFadingAway = false // Track whether fading away animation is in progress
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("diceeLogo")
                Spacer()
                HStack{
                    DiceView(n: leftDice)
                        .opacity(isFadingAway ? 0 : 1) // Apply fading away animation
                        .animation(Animation.easeOut(duration: 0.5).delay(0.5))
                    DiceView(n: rightDice)
                        .opacity(isFadingAway ? 0 : 1) // Apply fading away animation
                        .animation(Animation.easeOut(duration: 0.5).delay(0.5))
                }
                .padding(.horizontal)
                Spacer()
                AwesomeButton {
                    // Trigger rolling animation
                    self.isRolling = true
                    // Wait for 2 seconds before stopping animation and setting new dice values
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        // End rolling animation
                        self.isRolling = false
                        // Apply fading away animation
                        self.isFadingAway = true
                        // Wait for 0.5 seconds before resetting opacity and updating dice values
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            // Reset opacity
                            self.isFadingAway = false
                            // Update dice values
                            self.leftDice = Int.random(in: 1...6)
                            self.rightDice = Int.random(in: 1...6)
                        }
                    }
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
    var onTap: () -> Void
    
    var body: some View {
        Button(action: {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

