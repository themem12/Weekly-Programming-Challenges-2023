//
//  PrimeFibonachiPairViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 06/03/23.
//

import Foundation

class PrimeFibonachiPairViewModel: ObservableObject {
    
    @Published var isPairNumber = false
    @Published var isPrimeNumber = false
    @Published var isFibonachiNumber = false
    
    @Published var evaluationValue: String = "" {
        didSet {
            validate()
        }
    }
    
    func validate() {
        if let number = Int(evaluationValue) {
            isPair(number: number)
            isPrime(number: number)
            isFibonachi(number: number)
        } else {
            isPairNumber = false
            isPrimeNumber = false
            isFibonachiNumber = false
        }
    }
    
    func isPair(number: Int) {
        isPairNumber = number % 2 == 0
//        return number % 2 == 0 ? "es Par" : "es Inpar"
    }

    func isPrime(number: Int) {
        if number == 1 {
            isPrimeNumber = false
            return
        }
        if number == 2 {
            isPrimeNumber = true
            return
        }
        isPrimeNumber = number % 2 != 0
    }

    func isFibonachi(number: Int) {
        //5*n2 + 4 || 5*n2 - 4
        
        let base = 5 * (pow(Double(number), 2))
        
        let sqr1 = sqrt(base + 4)
        let sqr2 = sqrt(base - 4)
        
        isFibonachiNumber = floor(sqr1) == sqr1 || floor(sqr2) == sqr2
    }
    
}
