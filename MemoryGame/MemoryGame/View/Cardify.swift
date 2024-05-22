//
//  Cardify.swift
//  MemoryGame
//
//  Created by Nazmul Haque Nahin on 21/5/24.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    var isFaceUp : Bool
    var isMatched : Bool
    
    func body(content: Content) -> some View {
        ZStack{
            let shape = RoundedRectangle(
                cornerRadius: DrawingConstants.cornerRadius
            )
            
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(
                    lineWidth:DrawingConstants.lineWidth)
                content
            }else if isMatched{
                content.opacity(0)
               // shape.opacity(0)
            }
            else{
                shape.fill()
            }
            content.opacity(isFaceUp ? 1 : 0)
        }
    }
    
    
    
    
    // =================================
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale : CGFloat = 0.7
    }
    
    
    
    
    
    
}

