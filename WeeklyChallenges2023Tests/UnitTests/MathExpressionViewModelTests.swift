//
//  MathExpressionViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Guillermo Saavedra Dorantes  on 12/01/25.
//

import XCTest
@testable import WeeklyChallenges2023

final class MathExpressionViewModelTests: XCTestCase {

    let sut = MathExpressionViewModel()

    func test_withValidText_shouldReturnCorrect() {
        sut.fieldText = "1+2"
        sut.validatorColor = .green
        sut.validatorTitle = "Correct"
    }

    func test_withInvalidText_shouldReturnWrong() {
        sut.fieldText = "a"
        sut.validatorColor = .red
        sut.validatorTitle = "Wrong"
        sut.fieldText = "$"
        sut.validatorColor = .red
        sut.validatorTitle = "Wrong"
        sut.fieldText = "("
        sut.validatorColor = .red
        sut.validatorTitle = "Wrong"
    }

    func test_withEmptyText_shouldReturnEmpty() {
        sut.fieldText = ""
        sut.validatorColor = .gray
        sut.validatorTitle = "Empty"
    }

}
