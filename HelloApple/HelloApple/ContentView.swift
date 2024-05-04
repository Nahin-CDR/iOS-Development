//
//  ContentView.swift
//  HelloApple
//
//  Created by Nazmul Haque Nahin on 4/5/24.
//

import SwiftUI

struct Fruit: Identifiable {
    let id = UUID()
    let name: String
    let description: String
}

let fruits = [
    Fruit(
        name: "Apple",
        description: "Your chosen fruit was Apple"
    ),
    Fruit(
        name: "Banana",
        description: "Your chosen fruit was Banana"
    ),
    Fruit(
        name: "Orange",
        description: "Your chosen fruit was Orange"
    )
]

struct ContentView: View {
 
    var body: some View {
        VStack(
            content: {
                NavigationView {
                List(fruits) { fruit in
                    NavigationLink(
                       destination: DetailView(fruit:  fruit.description)) {
                       Text(fruit.name)
                    }
                }
                .navigationTitle("Fruits")
                }
                // end of navigation view
                NavigationLink(
                    destination: ScreenView()) {
                                   Text("Screen 1")
                                       .padding()
                                       .background(Color.blue)
                                       .foregroundColor(.white)
                                       .cornerRadius(8)
                }
            }
        )
    }
}


#Preview {
    ContentView()
}
