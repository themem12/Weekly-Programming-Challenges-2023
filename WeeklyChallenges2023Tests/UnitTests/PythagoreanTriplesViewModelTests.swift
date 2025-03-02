//
//  PythagoreanTriplesViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Guillermo Saavedra Dorantes  on 15/12/24.
//

import XCTest
@testable import WeeklyChallenges2023

final class PythagoreanTriplesViewModelTests: XCTestCase {

    let sut = PythagoreanTriplesViewModel()
    
    func test_withValidInput_shouldReturnCorrectResult() {
        sut.maxNumberText = "10"
        sut.getPythagoreanTriples()

        XCTAssertEqual(sut.pythagoreanTriples, ["(3, 4, 5)", "(6, 8, 10)"])

        sut.maxNumberText = "30"
        sut.getPythagoreanTriples()

        XCTAssertEqual(sut.pythagoreanTriples, ["(3, 4, 5)",
                                                "(5, 12, 13)",
                                                "(6, 8, 10)",
                                                "(7, 24, 25)",
                                                "(8, 15, 17)",
                                                "(9, 12, 15)",
                                                "(10, 24, 26)",
                                                "(12, 16, 20)",
                                                "(15, 20, 25)",
                                                "(18, 24, 30)",
                                                "(20, 21, 29)"])
    }

    func test_withInvalidInput_shouldReturnErrorResult() {
        sut.maxNumberText = "abc"
        sut.getPythagoreanTriples()

        XCTAssertEqual(sut.pythagoreanTriples, ["Not a valid number"])
    }
}
