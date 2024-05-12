//
//  DetailView.swift
//  NewsApp
//
//  Created by Nazmul Haque Nahin on 12/5/24.
//

import SwiftUI


struct DetailView: View {
    let url : String?
   
    var body: some View {
        WebView(urlString: url)
    }
}




#Preview {
    DetailView(url: "https://www.google.com")
}
