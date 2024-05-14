//
//  ContentView.swift
//  ViewPractice
//
//  Created by Nazmul Haque Nahin on 14/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return ZStack(
            content: {
                RoundedRectangle(
                    cornerRadius: 20
                )
                    .stroke(lineWidth: 3.0)
                    .padding(.horizontal)
                    .foregroundColor(.red)
                Text("Hello world")
            
            })
        .padding(.horizontal)
        .foregroundColor(.green)
    }
}

#Preview {
    ContentView()
}
