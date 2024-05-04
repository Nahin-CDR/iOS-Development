//
//  ContentView.swift
//  HelloApple
//
//  Created by Nazmul Haque Nahin on 4/5/24.
//

import SwiftUI

struct PageName: Identifiable {
    let id = UUID()
    let name: String
}

let pages = [
    PageName(name: "First Screen"),
    PageName(name: "Second Screen")
]



struct ContentView: View {
 
    var body: some View {
        VStack {
            NavigationView {
                List(pages) { page in
                    NavigationLink(
                        destination: ScreenView(screenName: page.name )) {
                            Text(page.name)
                        }
                }
                .navigationTitle("Home")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
