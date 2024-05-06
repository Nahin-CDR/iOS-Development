//
//  SinglePost.swift
//  HelloApple
//
//  Created by Nazmul Haque Nahin on 5/5/24.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

import SwiftUI

struct PostListView : View {
    @State private var posts: [Post] = []
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title).font(.headline)
                    Text(post.body).font(.body).foregroundColor(.green)
                }
               // .padding(.vertical, 10)
            }
           // .navigationTitle("Posts")
            .onAppear {
                // eta -> onAppear , flutter er init state er moto kaz kore
                fetchData()
            }
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") 
        else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to fetch data:", error?.localizedDescription ?? "Unknown error")
                return
            }
            
            do {
                posts = try JSONDecoder().decode([Post].self, from: data)
            } catch {
                print("Failed to decode data:", error.localizedDescription)
            }
        }.resume()
    }
}
// code portion to instant preview the UI changes
//struct CoPreviews: PreviewProvider {
//    static var previews: some View {
//        PostListView()
//    }
//}
