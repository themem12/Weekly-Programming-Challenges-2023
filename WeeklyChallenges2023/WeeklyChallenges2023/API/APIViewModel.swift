//
//  APIViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 09/03/23.
//

import Foundation

class APIViewModel: ObservableObject {
    @Published var apiResponse = ""
    @Published var isLoading = false
    
    func getAPIResponse() {
        isLoading = true
        
        guard let url = URL(string: "https://swapi.dev/api/films") else { return }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let data = data, let string = String(data: data, encoding: .utf8){
                DispatchQueue.main.async {
                    self.apiResponse = string
                    self.isLoading = false
                }
            }
        }

        task.resume()
    }
}
