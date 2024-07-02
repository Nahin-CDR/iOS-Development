//
//  example1.swift
//  UIPractice
//
//  Created by Nazmul Haque Nahin on 8/6/24.

import SwiftUI

struct Example1 : View{
    var body : some View{
        Text("Simple View")
            .modifier(RotatedTextModifier(angle:65))
    }
}



struct BorderModifiers: ViewModifier{
    var color: Color
    var width: CGFloat
    
    func body(content: Content) -> some View {
        content
            .border(color,width: width)
    }
}



struct CustomTextView : ViewModifier{
    
    func body(content: Content) -> some View {
       return content
            .foregroundColor(.green)
            .font(Font.system(size:30))
            .bold()
            
    }
}




struct RotatedTextModifier: ViewModifier{
    var angle: Double
    
    func body(content : Content) -> some View {
        content
            .rotationEffect(.degrees(angle))
    }
}






struct CustomTextView2 : ViewModifier{
    
    func body(content: Content) -> some View {
       return content
            .foregroundColor(.red)
            .font(Font.system(size:30))
            .bold()
            
    }
}
extension View{
    func CustomStyle2() -> some View {
        self.modifier(CustomTextView())
    }
    
    func Custom() -> some View {
        self.modifier(CustomTextView2())
    }
}


#Preview {
    Example1()
}
