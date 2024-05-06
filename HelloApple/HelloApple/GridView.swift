//
//  GridView.swift
//  HelloApple
//
//  Created by Nazmul Haque Nahin on 6/5/24.
//

import Foundation
import SwiftUI

// Model struct for product
struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
    struct Rating: Codable {
        let rate: Double
        let count: Int
    }
}

struct GridView: View {
    @State private var products: [Product] = []

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
                    ForEach(products) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductView(product: product)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .onAppear {
                loadData()
            }
        }
    }

    func loadData() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let decodedProducts = try? JSONDecoder().decode([Product].self, from: data) {
                DispatchQueue.main.async {
                    self.products = decodedProducts
                }
            }
        }.resume()
    }
}

struct ProductView: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            
            Text(product.title)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(2)
                .padding(.top, 8)
            
            Text("$\(String(format: "%.2f", product.price))")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

struct ProductDetailView: View {
    let product: Product

    var body: some View {
        VStack {
            Text(product.title)
                .font(.title)
                .padding()
            Spacer()
        }
        .navigationTitle(product.title)
    }
}

//struct ContentView_Previews2: PreviewProvider {
//    static var previews: some View {
//        GridView()
//    }
//}
