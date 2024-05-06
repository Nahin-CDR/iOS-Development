//
//  ContentView.swift
//  HelloApple
//
//  Created by Nazmul Haque Nahin on 4/5/24.
//

import SwiftUI


struct ContentView: View {

    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: PostListView()) { // Navigate to SinglePostView
                        Text("Post List")
                    }
                
                NavigationLink(
                    destination: ImageListView()) { // Navigate to SinglePostView
                        Text("Image List")
                    }
                NavigationLink(destination: SinglePost()){
                    Text("Single Post")
                }
                
            }
            .navigationTitle("Home")
        }
        
        
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
