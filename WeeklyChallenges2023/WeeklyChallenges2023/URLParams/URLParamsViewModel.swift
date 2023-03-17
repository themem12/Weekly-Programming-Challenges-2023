//
//  URLParamsViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 16/03/23.
//

import Foundation

class URLParamsViewModel: ObservableObject {
    @Published var fieldText = "" {
        didSet {
            getParamsFromURL()
        }
    }
    
    @Published var urlParams: [String] = []
    
    //https://retosdeprogramacion.com?year=2023&challenge=0
    private func getParamsFromURL() {
        urlParams = []
        let urlSplitted = fieldText.split(separator: "?")
        guard urlSplitted.count == 2, let params = urlSplitted.last?.split(separator: "&") else { return }
        
        for param in params {
            let splittedParam = param.split(separator: "=")
            guard splittedParam.count == 2, let newParam = splittedParam.last else { continue }
            urlParams.append(String(newParam))
        }
    }
    
}
