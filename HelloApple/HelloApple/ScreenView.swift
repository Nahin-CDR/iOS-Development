//
//  ScreenView.swift
//  HelloApple
//
//  Created by Nazmul Haque Nahin on 4/5/24.
//

import SwiftUI

struct ScreenView : View{
    let screenName : String
    @State private var imageData: Data?
      @State private var isLoading = false
      
      func loadImage() {
          guard let url = URL(string: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg") else { return }
          
          isLoading = true
          URLSession.shared.dataTask(with: url) { data, response, error in
              guard let data = data, error == nil else {
                  print("Failed to load image:", error?.localizedDescription ?? "Unknown error")
                  return
              }
              
              DispatchQueue.main.async {
                  self.imageData = data
                  isLoading = false
              }
          }.resume()
      }
      
      var body: some View {
          VStack {
              if let imageData = imageData, let uiImage = UIImage(data: imageData) {
                  Image(uiImage: uiImage)
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: 200, height: 200)
              } else if isLoading {
                  ProgressView()
                      .progressViewStyle(CircularProgressViewStyle())
              } else {
                  Text("Image Loading Failed")
                      .foregroundColor(.red)
              }
          }
          .onAppear {
              loadImage()
          }.navigationTitle("\(screenName)")
      }
}
//struct ScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScreenView()
//    }
//}
