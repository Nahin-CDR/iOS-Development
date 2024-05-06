import SwiftUI

struct ProductCategories: View {
    @State private var categories: [String] = []
    
    var body: some View {
        NavigationView {
            List(categories, id: \.self) { category in
                NavigationLink(destination: Text("Category: \(category)")) {
                    Text(category)
                }
            }
            .onAppear {
                fetchCategories()
            }
        }
    }
    
    private func fetchCategories() {
        guard let url = URL(string: "https://fakestoreapi.com/products/categories") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data received.")
                return
            }
            
            do {
                let decodedCategories = try JSONDecoder().decode([String].self, from: data)
                DispatchQueue.main.async {
                    self.categories = decodedCategories
                }
            } catch {
                print("Error decoding categories: \(error)")
            }
        }.resume()
    }
}

struct ProductCategories_Previews: PreviewProvider {
    static var previews: some View {
        ProductCategories()
    }
}
