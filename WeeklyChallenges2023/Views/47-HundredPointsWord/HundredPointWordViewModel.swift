//
//  HundredPointWordViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 18/12/24.
//

import Foundation

final class HundredPointWordViewModel: ObservableObject {

    @Published var wordText: String = ""
    @Published var showWinner: Bool = false
    @Published var points = 0

    public func countPoints() {
        points = 0
        guard !wordText.isEmpty else { return }
        let asciiValues = wordText.uppercased().asciiValues.map { Int($0) }
        for value in asciiValues {
            points += (value - 64)
        }
        if points >= 100 {
            showWinner = true
        }
    }
}
