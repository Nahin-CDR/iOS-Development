import SwiftUI

struct ContentView: View {
    @State private var isAnimated = false
    @State private var animateText = false
    
    
    var body : some View{
        ToastView()
        //Generics()
    }
    
    
    var body1: some View {
        ZStack {
            // Background color
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("nahin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                
                // Full name
                HStack(spacing: 0) {
                    ForEach(0..<("Nazmul Haque Nahin".count), id: \.self) { index in
                        Text(String("Nazmul Haque Nahin"["Nazmul Haque Nahin".index("Nazmul Haque Nahin".startIndex, offsetBy: index)]))
                            .font(Font.custom("Pacifico-Regular", size: 35))
                            .bold()
                            .foregroundColor(.white)
                            .offset(x: animateText ? 0 : 300)
                            .animation(Animation.easeInOut(duration:     2.5).delay(0.1 * Double(index)))
                    }
                }
                
                // Job title
                Text("Software Engineer")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                
                Divider()
                
                // Contact info views
                ContactInfo(text: "+88 0123456789", imageName: "phone.fill")
                ContactInfo(text: "nahin.cdr@gmail.com", imageName: "envelope2.fill")
            }
        }
        .onAppear {
            withAnimation {
                animateText = true
            }
        }
    }
}





#Preview {
    ContentView()
}
