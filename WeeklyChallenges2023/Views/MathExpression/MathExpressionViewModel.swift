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
        print(fieldText)
        guard !fieldText.isEmpty else {
            return updateUI(.empty)
        }
        guard fieldText != "ab" else {
            return updateUI(.invalid)
        }
        updateUI(.valid)
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
