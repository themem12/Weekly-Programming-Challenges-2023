//
//  PermutationsViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Guillermo Saavedra Dorantes  on 09/12/24.
//

import XCTest
@testable import WeeklyChallenges2023

final class PermutationsViewModelTests: XCTestCase {
    
    let sut = PermutationsViewModel()

    func test_withWord_shouldReturn_correctArray() {
        sut.wordToPermute = "sol"
        sut.startPermutations()
        XCTAssertEqual(sut.permutations, ["sol", "slo", "osl", "ols", "lso", "los"])
    }

    func test_withEmptyText_shouldReturn_errorMessage() {
        sut.wordToPermute = ""
        sut.startPermutations()
        XCTAssertEqual(sut.permutations, ["Can't permute an empty word"])
    }
}
