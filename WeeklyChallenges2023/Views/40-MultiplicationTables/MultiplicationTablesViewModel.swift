//
//  MultiplicationTablesViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 15/12/24.
//

import Foundation

final class MultiplicationTablesViewModel: ObservableObject {

    @Published var numberText: String = ""
    @Published var multiplicationTable: [String] = []

    public func getMultiplicationTable() {
        multiplicationTable.removeAll()
        guard let number = Int(numberText) else { return multiplicationTable.append("Invalid number") }

        for i in 0...10 {
            let row = "\(number) X \(i) = \(number * i)"
            multiplicationTable.append(row)
        }
    }
}
