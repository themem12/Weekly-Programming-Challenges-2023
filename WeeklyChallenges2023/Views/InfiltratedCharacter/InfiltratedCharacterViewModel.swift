//
//  InfiltratedCharacterViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 02/11/24.
//

import Foundation

class InfiltratedCharacterViewModel: ObservableObject {
    @Published var firstFieldString: String = ""
    @Published var secondFieldString: String = ""
    
    @Published var infiltratedCharacters: [String] = []
    
    public func validateStrings() {
        infiltratedCharacters = []
        guard firstFieldString.count > 0, secondFieldString.count > 0 else {
            infiltratedCharacters = ["The Strings must not be empty"]
            return
        }
        guard firstFieldString.count == secondFieldString.count else {
            infiltratedCharacters = ["The Strings must be equal in length"]
            return
        }
        
        for index in 0..<firstFieldString.count {
            if firstFieldString[index] != secondFieldString[index] {
                infiltratedCharacters.append(secondFieldString[index])
            }
        }
        if infiltratedCharacters.isEmpty {
            infiltratedCharacters.append("No Infiltrated Characters!!!")
        }
    }
}
