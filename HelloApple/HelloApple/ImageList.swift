//
//  ImageList.swift
//  HelloApple
//
//  Created by Nazmul Haque Nahin on 5/5/24.
//

import Foundation
import SwiftUI

struct CatImage: Identifiable, Decodable {
    let id: String
    let url: String
    let width: Int
    let height: Int
}


struct ImageListView: View {
    @State private var catImages: [CatImage] = []
    
    var body: some View {
        NavigationView {
            List(catImages) { catImage in
                AsyncImage(url: URL(string: catImage.url)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .clipped()
                    case .failure:
                        Text("Failed to load image")
                    case .empty:
                        ProgressView()
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 200, height: 200)
                .cornerRadius(8)
            }
            //.navigationTitle("Cat Images")
            .onAppear {
                fetchData()
            }
        }//.navigationTitle("Image List")
    }
    
    func fetchData() {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=20") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to fetch data:", error?.localizedDescription ?? "Unknown error")
                return
            }
            
            do {
                catImages = try JSONDecoder().decode([CatImage].self, from: data)
            } catch {
                print("Failed to decode data:", error.localizedDescription)
            }
        }.resume()
    }
}
