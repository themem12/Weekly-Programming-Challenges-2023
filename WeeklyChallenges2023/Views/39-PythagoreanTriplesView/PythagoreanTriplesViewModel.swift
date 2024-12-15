//
//  PythagoreanTriplesViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 15/12/24.
//

import Foundation

final class PythagoreanTriplesViewModel: ObservableObject {

    @Published var maxNumberText: String = ""
    @Published var pythagoreanTriples: [String] = []
    
    func getPythagoreanTriples() {
        guard let maxNumber = Int(maxNumberText) else { return pythagoreanTriples = ["Not a valid number"] }
        pythagoreanTriples.removeAll()
        for a in 1..<maxNumber {
            for b in a+1..<maxNumber {
                let c = sqrt(Double(a*a + b*b))
                guard floor(c) == c, Int(c) <= maxNumber else { continue }
                pythagoreanTriples.append("(\(a), \(b), \(Int(c)))")
            }
        }
        guard pythagoreanTriples.count > 0 else { return pythagoreanTriples = ["No results found"] }
    }
}
