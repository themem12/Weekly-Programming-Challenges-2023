//
//  CesarCypherViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 16/06/23.
//

import Foundation

class CesarCypherViewModel: ObservableObject {
    @Published var textFieldString: String = "" {
        didSet {
            guard textFieldString != "" else { return }
            newText = textCypher(textFieldString)
        }
    }
    @Published var isCypher: Bool = true {
        didSet {
            textFieldString = ""
            newText = ""
        }
    }
    @Published var newText: String = ""
    
    private let cypherKey = 3
    
    private func textCypher(_ text: String) -> String {
        let asciiChars = text.asciiValues
        var resultString = ""
        for asciiChar in asciiChars {
            if isCypher {
                let c = Character(UnicodeScalar(asciiChar + UInt8(cypherKey)))
                resultString.append(c)
            } else {
                let c = Character(UnicodeScalar(asciiChar - UInt8(cypherKey)))
                resultString.append(c)
            }
        }
        return resultString
    }
}

extension StringProtocol {
    var asciiValues: [UInt8] { compactMap(\.asciiValue) }
}
