//
//  UserViewModel.swift
//  HelloApp
//
//  Created by Nazmul Haque Nahin on 16/9/24.
//

import SwiftUI

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading: Bool = true
    @Published var errorMessage: String?

    init() {
        fetchUsers()
    }

    func fetchUsers() {
        isLoading = true
        errorMessage = nil
        
        NetworkManager.shared.fetchUsers { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let users):
                    self?.users = users
                case .failure(let error):
                    self?.errorMessage = "Failed to load users: \(error.localizedDescription)"
                }
            }
        }
    }
}

