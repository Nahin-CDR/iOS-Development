//
//  ContentView.swift
//  HelloApp
//
//  Created by Nazmul Haque Nahin on 16/9/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = UserViewModel()

    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                ScrollView {
                    ForEach(viewModel.users) { user in
                        UserView(user: user)
                    }
                }
                .navigationBarTitle("Users")
                .background(Color(.systemGray6))
            }
        }
    }
}
#Preview {
    ContentView()
}
