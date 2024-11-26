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

public struct AbacusCount: Hashable {
    let unit: AbacusUnits
    var count: Int
}

final class AbacusViewModel: ObservableObject {
    @Published var number = "0"
    
    @Published var abacus: [AbacusCount] = {
        return [
            .init(unit: .million, count: 9), // 1,000,000
            .init(unit: .thousandHundreds, count: 9), // 100,000
            .init(unit: .thousandTens, count: 9), // 10,000
            .init(unit: .thousandUnits, count: 9), // 1,000
            .init(unit: .hundreds, count: 9), // 100
            .init(unit: .tens, count: 9), // 10
            .init(unit: .units, count: 9), // 1
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
            if abacus[index].count < 9 {
                abacus[index].count += 1
            }
        } else {
            if abacus[index].count > 0 {
                abacus[index].count -= 1
            }
        }
        makeNumber()
    }

    private func makeNumber() {
        var text = ""
        for count in abacus {
            text.append("\(9 - count.count)")
        }
        number = "\(Int(text) ?? 0)"
    }
}
