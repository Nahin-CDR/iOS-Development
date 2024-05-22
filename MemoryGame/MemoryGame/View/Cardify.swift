//
//  Cardify.swift
//  MemoryGame
//
//  Created by Nazmul Haque Nahin on 21/5/24.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    var animatableData: Double{
        get{
            rotation
        }
        set{
            rotation = newValue
        }
    }
    
    init(isFaceUp : Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    
    var rotation : Double // in degrees
    
    func body(content: Content) -> some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius:DrawingConstants.cornerRadius)
            
            if rotation < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth:DrawingConstants.lineWidth)
            }
            else{
                shape.fill()
            }
            content.opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(rotation),axis: (0,1,0))
        
    }
    
    
    
    
    // =================================
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale : CGFloat = 0.7
    }
    
    
    
    
    
    
}

