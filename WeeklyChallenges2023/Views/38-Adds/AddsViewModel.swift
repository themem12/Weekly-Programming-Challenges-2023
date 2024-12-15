//
//  AddsViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 10/12/24.
//

import Foundation

final class AddsViewModel: ObservableObject {
    var numbers = [1, 5, 3, 2]
    var target = 6
    var combinations = [[Int]]()

    func searchCombinations(path: inout [Int], target: Int, index: Int = 0) {
        if target == 0 {
            combinations.append(path)
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
        var path = [Int]()
        searchCombinations(path: &path,target: target)
    }
}
