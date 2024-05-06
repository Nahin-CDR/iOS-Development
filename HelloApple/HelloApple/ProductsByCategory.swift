//
//  ProductsByCategory.swift
//  HelloApple
//
//  Created by Nazmul Haque Nahin on 6/5/24.
//

import Foundation
import SwiftUI

// https://fakestoreapi.com/products/category/jewelery



/*
  ============================ STEPS ====================
  
 1. first e api data er model create korbo
 2. then view create korbo
 3. then call dibo on appear e
 */


// Eta holo product model,,
//API theke je json pabo seta je variable e store korbo oitar data type hobe ei model
struct ProductModel: Codable, Identifiable {
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

let baseUrl = "https://fakestoreapi.com/products/category/"



struct ProductsByCategory : View{
    
    
    @State private var products : [ProductModel] = []
    let category : String
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(
                    columns: Array(
                        repeating: GridItem(.flexible()),
                        count: 2
                    ), spacing: 10) {
                    ForEach(products) { product in
                        NavigationLink(destination: ProductDetailViews(product: product)) {
                            ProductViews(product: product)
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
        let urlString = "\(baseUrl)\(category)"

        // Encode the URL string
        guard let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            fatalError("Failed to encode URL string")
        }
        guard let url = URL(string: encodedUrlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let decodedProducts = try? JSONDecoder().decode([ProductModel].self, from: data) {
                DispatchQueue.main.async {
                    self.products = decodedProducts
                }
            }
        }.resume()
    }
}


struct ProductViews: View {
    let product: ProductModel

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

struct ProductDetailViews: View {
    let product: ProductModel

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
