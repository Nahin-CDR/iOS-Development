//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Nazmul Haque Nahin on 11/5/24.
//

import Foundation

let apiEndPoint = "http://hn.algolia.com/api/v1/search?tags=front_page";
class NetworkManager : ObservableObject {
    
    @Published var posts : [Post] = []
    
    func FetchData(){
        if let url = URL(string: apiEndPoint){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){(data,response,error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                           let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            // to start the task
            task.resume()
        }
    }
    
}
