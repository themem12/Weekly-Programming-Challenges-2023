//
//  AddsViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 10/12/24.
//

import Foundation

final class AddsViewModel: ObservableObject {

    @Published var numbersText: String = "" {
        didSet {
            let numbersFromText = numbersText.components(separatedBy: ".").compactMap { Int($0) }
            self.numbers = numbersFromText
        }
    }
    @Published var targetText: String = "" {
        didSet {
            self.target = Int(targetText) ?? 0
        }
    }
    @Published var combinations = [[Int]]()

    private var numbers = [Int]()
    var target = 0

    func searchCombinations(path: inout [Int], target: Int, index: Int = 0) {
        if target == 0 {
            if !path.isEmpty {
                combinations.append(path)
            }
            return
        }
        for i in index..<numbers.count {
            let number = numbers[i]
            if number <= target {
                let newTarget = target - number
                path.append(number)
                searchCombinations(path: &path, target: newTarget, index: i + 1)
                path.removeLast()
            }
        }
    }

    func startSearch() {
        combinations = []
        var path = [Int]()
        searchCombinations(path: &path,target: target)
    }
}
