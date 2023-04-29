//
//  DecimalConversionViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 14/04/23.
//

import Foundation

class DecimalConversionViewModel: ObservableObject {
    
    @Published var numberToConvert: String = "" {
        didSet {
            if let number = Int(numberToConvert) {
                infoString = ""
                convertDecimal(number)
            } else {
                if numberToConvert != "" {
                    infoString = "Da un número válido"
                } else {
                    infoString = ""
                }
            }
        }
    }
    
    @Published var infoString: String = ""
    
    @Published var octalString: String = ""
    @Published var hexalString: String = ""
    
    private func convertDecimal(_ number: Int) {
        octalString = convertTo(8, number: number)
        hexalString = convertTo(16, number: number)
    }
    
    private func convertTo(_ base: Int, number: Int) -> String {
        let division = number.quotientAndRemainder(dividingBy: base)
        if division.quotient == 0 {
            return "\(division.remainder)"
        } else {
            return "\(convertTo(base, number: division.quotient))\(division.remainder.changeBaseString(base))"
        }
    }
}

extension Int {
    func changeBaseString(_ base: Int) -> String {
        if base == 8 { return "\(self)" }
        let dictionary = [
            0: "0",
            1: "1",
            2: "2",
            3: "3",
            4: "4",
            5: "5",
            6: "6",
            7: "7",
            8: "8",
            9: "9",
            10: "A",
            11: "B",
            12: "C",
            13: "D",
            14: "E",
            15: "F",
        ]
        
        return dictionary[self] ?? ""
    }
}
