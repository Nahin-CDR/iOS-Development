//
//  ToastView.swift
//  MemoryGame
//
//  Created by Nazmul Haque Nahin on 26/5/24.
//

import SwiftUI

struct ToastView: View {
    var style: ToastStyle
    var message: String
    var width = CGFloat.infinity
    
    var onCancelTapped: (() -> Void)
    
    
    
    var body: some View{
        // VSTACK is creating the upper space that lower the postion at bottom
        VStack{
           Spacer(minLength: UIScreen.main.bounds.height-150)
        }
        HStack(alignment: .center,spacing: 12){
           
            Text(message)
                .font(Font.caption)
                .foregroundColor(Color.white)
            
            Spacer(minLength: 5)
            Image(systemName: style.iconFileName)
                .foregroundColor(style.themeColor)
            
//            Button{
//                onCancelTapped()
//            }label: {
//                Image(systemName: "xmark")
//                    .foregroundColor(style.themeColor)
//            }
        }
        .padding()
        .frame(minWidth: 10,maxWidth: width)
        .background(Color.gray)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .opacity(0.001)
        )
        .padding(.horizontal,16)
    }
}
