//
//  ExcelColumnViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 25/11/24.
//

import Foundation

final class ExcelColumnViewModel: ObservableObject {
    
    @Published public private(set) var columnNumber = 0
    @Published public var isInvalid = false
    @Published public private(set) var errorString: String? = nil
    @Published public var text = "" {
        didSet {
            getColumnNumber(column: text)
        }
    }
    
    public func getColumnNumber(column: String) {
        errorString = nil
        isInvalid = false
        var columnNumber = 0
        let letters = column.map { Character(String($0).uppercased()) }
        
        for index in 0..<letters.count {
            let letter = letters[index]
            if let asciiValue = letter.asciiValue {
                let value = Int(asciiValue) - 64
                guard value > 0, value < 28 else {
                    self.isInvalid = true
                    self.errorString = "Invalid value"
                    self.columnNumber = 0
                    return
                }
                if index == letters.count - 1 {
                    columnNumber += value
                } else {
                    columnNumber += 26 * value
                }
            }
        }
        self.columnNumber = columnNumber
    }
}
