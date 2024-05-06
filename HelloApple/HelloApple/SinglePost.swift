//
//  SinglePost.swift
//  HelloApple
//
//  Created by Nazmul Haque Nahin on 6/5/24.
//

import SwiftUI
import Foundation


/*
 {
   "userId": 1,
   "id": 1,
   "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
   "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum
           nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
 }
 */


struct Post1: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct SinglePost: View {
    @State private var post: Post1?
    @State private var isAnimating = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let post = post {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
                    .overlay(
                        VStack(alignment: .leading, spacing: 16) {
                            Text(post.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .opacity(isAnimating ? 1 : 0)
                                .animation(.easeInOut(duration: 0.5))
                            Text(post.body)
                                .font(.body)
                                .foregroundColor(.white)
                                .opacity(isAnimating ? 1 : 0)
                                .animation(.easeInOut(duration: 0.5).delay(0.3))
                        }
                        .padding()
                    )
                    .padding()
            } else {
                ProgressView("Loading...")
            }
        }
        .onAppear {
            loadData()
            withAnimation {
                isAnimating = true
            }
        }
    }

    func loadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let decodedPost = try? JSONDecoder().decode(Post1.self, from: data) {
                DispatchQueue.main.async {
                    self.post = decodedPost
                }
            }
        }.resume()
    }
}

struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        SinglePost()
    }
}
