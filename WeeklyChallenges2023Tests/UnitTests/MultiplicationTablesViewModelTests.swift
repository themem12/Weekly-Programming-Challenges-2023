//
//  MultiplicationTablesViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Guillermo Saavedra Dorantes  on 15/12/24.
//

import XCTest
@testable import WeeklyChallenges2023

final class MultiplicationTablesViewModelTests: XCTestCase {

    let sut = MultiplicationTablesViewModel()

    func test_withValidInput_shouldReturnCompleteTable() {
        sut.numberText = "5"
        sut.getMultiplicationTable()
        var expectedTable = [
            "5 X 0 = 0",
            "5 X 1 = 5",
            "5 X 2 = 10",
            "5 X 3 = 15",
            "5 X 4 = 20",
            "5 X 5 = 25",
            "5 X 6 = 30",
            "5 X 7 = 35",
            "5 X 8 = 40",
            "5 X 9 = 45",
            "5 X 10 = 50"
        ]
        XCTAssertEqual(sut.multiplicationTable, expectedTable)

        sut.numberText = "9"
        sut.getMultiplicationTable()
        expectedTable = [
            "9 X 0 = 0",
            "9 X 1 = 9",
            "9 X 2 = 18",
            "9 X 3 = 27",
            "9 X 4 = 36",
            "9 X 5 = 45",
            "9 X 6 = 54",
            "9 X 7 = 63",
            "9 X 8 = 72",
            "9 X 9 = 81",
            "9 X 10 = 90"
        ]
        XCTAssertEqual(sut.multiplicationTable, expectedTable)

        sut.numberText = "20"
        sut.getMultiplicationTable()
        expectedTable = [
            "20 X 0 = 0",
            "20 X 1 = 20",
            "20 X 2 = 40",
            "20 X 3 = 60",
            "20 X 4 = 80",
            "20 X 5 = 100",
            "20 X 6 = 120",
            "20 X 7 = 140",
            "20 X 8 = 160",
            "20 X 9 = 180",
            "20 X 10 = 200"
        ]
        XCTAssertEqual(sut.multiplicationTable, expectedTable)
    }

    func test_withInvalidInput_shouldReturnEmptyTable() {
        sut.numberText = "ABC"
        sut.getMultiplicationTable()
        XCTAssertEqual(sut.multiplicationTable, ["Invalid number"])
    }
        
}
