//
//  L33tStringExtensions.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 07/01/23.
//

import Foundation

public extension String {
    func translateTo(_ type: Alphabets.Alphabets) -> String {
        var alphabet = [String: [String]]()
        var isRandom = false
        switch type {
        case .basic:
            alphabet = Alphabets().basicAlphabet
        case .intermediate:
            alphabet = Alphabets().intermediateAlphabet
        case .advande:
            isRandom = true
            alphabet = Alphabets().advanceAlphabet
        case .fullRetard:
            isRandom = true
            alphabet = Alphabets().fullRetardAlphabet
        }
        
        return String(Array(self.lowercased()).map({ String($0) }).flatMap({
            if isRandom {
                let index = (alphabet[$0] ?? []).count - 1
                return alphabet[$0]?[Int.random(in: 0..<index)] ?? $0
            } else {
                return alphabet[$0]?[0] ?? $0
            }
        }))
    }
}
