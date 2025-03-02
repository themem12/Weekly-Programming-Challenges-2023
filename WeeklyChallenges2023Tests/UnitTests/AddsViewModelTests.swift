//
//  AddsViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Saavedra, Guillermo on 13/12/24.
//

import XCTest
@testable import WeeklyChallenges2023

final class AddsViewModelTests: XCTestCase {

    let sut = AddsViewModel()

    func test_withCorrectText_shouldReturn_correctCombinations() {
        sut.numbersText = "1.5.3.2"
        sut.targetText = "6"
        sut.startSearch()
        XCTAssertEqual(sut.combinations, [[1,5], [1,3,2]])
    }

    func test_withIncorrectText_shouldReturn_emptyCombinations() {
        sut.numbersText = "1,5,3,2"
        sut.targetText = "6"
        sut.startSearch()
        XCTAssertEqual(sut.combinations, [])
    }

    func test_withIncorrectTargetText_shouldReturn_emptyCombinations() {
        sut.numbersText = "1.5.3.2"
        sut.targetText = "6.5"
        sut.startSearch()
        XCTAssertEqual(sut.combinations, [])
    }
}
