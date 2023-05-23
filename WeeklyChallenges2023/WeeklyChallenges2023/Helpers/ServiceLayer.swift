//
//  ServiceLayer.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 22/05/23.
//

import Foundation


class ServiceLayer {
    func callApi<T: Codable>(resultType: T.Type, url: String, completion: @escaping (T?)->()) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error while fetching json: ", error.localizedDescription)
                completion(nil)
            }
            
            guard let jsonData = data else {
                completion(nil)
                return
            }
            
//            let json = String(data: jsonData, encoding: .utf8)
//            print("json:", json ?? "")
            
            let decoder = JSONDecoder()
            
            do {
                let todoItems = try decoder.decode(T.self, from: jsonData)
                completion(todoItems)
            } catch (let decodingError) {
                completion(nil)
                print("Error while decoding jsonData", decodingError)
            }
        }.resume()
    }
    
    func callAPI(url: String, completion: @escaping (String?)->()) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error while fetching json: ", error.localizedDescription)
                completion(nil)
            }
            
            guard let jsonData = data else {
                completion(nil)
                return
            }
            
            let json = String(data: jsonData, encoding: .utf8)
//            print("json:", json ?? "")
            
            completion(json)
        }.resume()
    }
}
