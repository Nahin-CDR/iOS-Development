//
//  ContentView.swift
//  HelloApple
//
//  Created by Nazmul Haque Nahin on 4/5/24.
//

import SwiftUI

let productCategoryUrl = "https://fakestoreapi.com/products/categories"

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
                
                NavigationLink(destination: GridView()){
                    Text("Grid View")
                }
                
                NavigationLink(
                    destination: ProductCategories()){
                    Text("Product Categories")
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
