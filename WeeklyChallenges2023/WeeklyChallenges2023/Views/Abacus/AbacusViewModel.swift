//
//  AbacusViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 20/11/24.
//

import Foundation

public enum AbacusUnits {
    case units
    case tens
    case hundreds
    case thousandUnits
    case thousandTens
    case thousandHundreds
    case million
}

final class AbacusViewModel {
    @Published var number = ""
    
    private var abacus: [Int] = {
        return [
            0, // 1,000,000
            0, // 100,000
            0, // 10,000
            0, // 1,000
            0, // 100
            0, // 10
            0, // 1
        ]
    }()

    public func move(_ unit: AbacusUnits, add: Bool = true) {
        var index = -1
        switch unit {
        case .units:
            index = 6
        case .tens:
            index = 5
        case .hundreds:
            index = 4
        case .thousandUnits:
            index = 3
        case .thousandTens:
            index = 2
        case .thousandHundreds:
            index = 1
        case .million:
            index = 0
        }
        if add {
            if abacus[index] < 9 {
                abacus[index] += 1
            }
        } else {
            if abacus[index] > 0 {
                abacus[index] -= 1
            }
        }
        makeNumber()
    }

    private func makeNumber() {
        number = ""
        for unit in abacus {
            if unit > 0 {
                number.append("\(unit)")
            }
        }
    }
}
