//
//  PostData.swift
//  NewsApp
//
//  Created by Nazmul Haque Nahin on 12/5/24.
//

import Foundation

struct Results : Decodable{
    let hits : [Post]
}

struct Post : Decodable, Identifiable{
    
    var id : String {
        return objectID
    }
    
    let objectID : String
    let points : Int
    let title : String
    let url : String?
}
