//
//  LadderViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 29/04/23.
//

import Foundation

class LadderViewModel: ObservableObject {
    @Published var isPositive = true {
        didSet {
            if let numberOfStepsInt = Int(numberOfSteps) {
                createLadder(numberOfStepsInt)
            }
        }
    }
    @Published var numberOfSteps: String = "" {
        didSet {
            if let numberOfStepsInt = Int(numberOfSteps) {
                createLadder(numberOfStepsInt)
            }
        }
    }
    @Published var ladderText: String = ""
    
    private func createLadder(_ steps: Int) {
        ladderText = ""
        if steps == 0 {
            ladderText = "__"
        }
        if isPositive {
            ladderText.append("_\n")
            for step in 0..<steps {
                ladderText.append(String(repeating: "   ", count: step + 1))
                ladderText.append("|_\n")
            }
        } else {
            ladderText.append(String(repeating: "   ", count: steps + 1))
            ladderText.append("_\n")
            for step in 0..<steps {
                ladderText.append(String(repeating: "   ", count: steps - step))
                ladderText.append("_|\n")
            }
        }
    }
}
