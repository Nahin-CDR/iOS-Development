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
        SplashScreen()
    }
}



// code for splash screen


struct SplashScreen: View {
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background color or image
                Color.blue.edgesIgnoringSafeArea(.all) // Change color as per your preference
                
                // Splash screen content
                VStack {
                    Text("Hello Nahin")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                }
            }
            .onAppear {
                // Start a timer to navigate to the home screen after 2 seconds
                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
                    isActive = true
                }
            }
            // Navigate to home screen when isActive is true
            .background(NavigationLink("", destination: ContentView(), isActive: $isActive))
            // Hide navigation bar title
            .navigationBarHidden(true) // Hide navigation bar
        }
    }
}
