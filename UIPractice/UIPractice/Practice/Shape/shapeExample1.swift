//
//  shapeExample1.swift
//  UIPractice
//
//  Created by Nazmul Haque Nahin on 12/6/24.
//

import SwiftUI

struct shapeExample1: View {
    var body: some View {
        
        ScrollView{
            Ellipse().frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Circle()
        }
        // Circle()
        //.fill(.green)
        //.stroke(.red,style: StrokeStyle(
        //
        //))
        //.trim(from:0.2,to: 1.0)
        //.frame(width: 300,height: 100)
        
        
      
    }
}
















#Preview {
    shapeExample1()
}
