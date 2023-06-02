//
//  PrimeTwinsNumberViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 01/06/23.
//

import Foundation

final class PrimeTwinsNumberViewModel: ObservableObject {
    @Published var rangeNumber: Int = 0 {
        didSet {
            getPrimeNumbers(rangeNumber)
        }
    }
    
    @Published var primeTwinsNumbers: String = ""
    
    private func getPrimeTwinsNumber(_ primeNumbers: [Int]) {
        
        for index in 0..<(primeNumbers.count - 1) {
            if primeNumbers[index + 1] - 2 == primeNumbers[index] {
                primeTwinsNumbers.append("(\(primeNumbers[index]),\(primeNumbers[index + 1]))\n")
            }
        }
        
        if primeTwinsNumbers.isEmpty { primeTwinsNumbers = "----" }
    }
    
    private func getPrimeNumbers(_ rangeNumber: Int) {
        
        guard rangeNumber > 2 else {
            primeTwinsNumbers = "----"
            return
        }
        
        var primeNumbers: [Int] = []
        
        for number in 2...rangeNumber {
            if number == 2 || number == 3 || number == 5 || number == 7 {
                primeNumbers.append(number)
            } else if number % 2 != 0, number % 3 != 0, number % 5 != 0, number % 7 != 0 {
                primeNumbers.append(number)
            }
        }
        
        guard !primeNumbers.isEmpty else {
            primeTwinsNumbers = "----"
            return
        }
        
        primeTwinsNumbers = ""
        getPrimeTwinsNumber(primeNumbers)
    }
}
