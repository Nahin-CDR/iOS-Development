//
//  ContentView.swift
//  NewsApp
//
//  Created by Nazmul Haque Nahin on 11/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            
            List(networkManager.posts){ post in
               
                NavigationLink(
                    destination: DetailView(url: post.url)){
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                // horizontal stack view
               
                
            }.navigationTitle("News App")
            
            
            
        }.onAppear(){
            self.networkManager.FetchData()
        }
    }
}






#Preview {
    ContentView()
}
