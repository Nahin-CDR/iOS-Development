//
//  UserModel.swift
//  HelloApp
//
//  Created by Nazmul Haque Nahin on 15/9/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let company: Company
    let address: Address

    struct Company: Codable {
        let name: String
        let catchPhrase: String
    }

    struct Address: Codable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
    }
}
