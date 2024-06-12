//
//  example2.swift
//  UIPractice
//
//  Created by Nazmul Haque Nahin on 9/6/24.
//

import SwiftUI

struct Example2View: View {
    var body: some View {
        ScrollView{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .CustomShadow()
            
            Text("Rounded")
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .modifier(RounderCornersModifier(radius: 10))
            
           // Spacer(minLength: 5)
                
            Text("Bordered Text")
                
                .modifier(BorderModifier(color: .red, width: 2))
            
        }
        
    }
}
















// Border Modifier

struct BorderModifier: ViewModifier{
    
    var color: Color
    var width: CGFloat
    
    func body(content:Content) -> some View {
        content
            .border(color,width: width)
    }
}










// rounded corner modifier
struct RounderCornersModifier: ViewModifier{
    var radius:CGFloat
    
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: radius))
    }
    
}











// made a shadow modifier that will modify the shadow of
// any content that we will pass

struct ShadowModifier: ViewModifier{
    func body(content:Content) -> some View{
        content
            .font(Font.system(size: 40))
            .shadow(color:.red,radius: 10,x: 5,y: 5)
    }
}


extension View{
    func CustomShadow() -> some View{
        self.modifier(ShadowModifier())
    }
}









#Preview {
    Example2View().preferredColorScheme(.dark)
}
