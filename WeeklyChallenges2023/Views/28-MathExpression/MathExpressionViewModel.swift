//
//  MathExpressionViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 22/10/24.
//

import Foundation
import SwiftUI

final class MathExpressionViewModel: ObservableObject {
    private enum ExpressionState {
        case empty
        case valid
        case invalid
    }
    @Published var fieldText: String = "" {
        didSet {
            validateExpression()
        }
    }
    var validatorColor: Color = .gray
    var validatorTitle: String = "Empty"
    
    private func validateExpression() {
        guard !fieldText.isEmpty else {
            return updateUI(.empty)
        }
        guard validateText(text: fieldText) else {
            return updateUI(.invalid)
        }
        updateUI(.valid)
    }

    private func validateText(text: String) -> Bool {
        let symbols = ["+", "-", "*", "/"]
        var canContinueWithSymbol = true
        for char in text {
            if symbols.contains(String(char)), canContinueWithSymbol {
                canContinueWithSymbol = false
            } else {
                guard let _ = Int(String(char)) else {
                    return false
                }
                canContinueWithSymbol = true
            }
        }
        return true
    }
    
    private func updateUI(_ state: ExpressionState) {
        switch state {
        case .empty:
            validatorColor = .gray
            validatorTitle = "Empty"
        case .valid:
            validatorColor = .green
            validatorTitle = "Correct"
        case .invalid:
            validatorColor = .red
            validatorTitle = "Wrong"
        }
    }
}
