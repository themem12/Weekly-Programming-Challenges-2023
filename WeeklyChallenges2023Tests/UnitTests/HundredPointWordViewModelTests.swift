//
//  HundredPointWordViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Saavedra, Guillermo on 18/12/24.
//

import XCTest
@testable import WeeklyChallenges2023
final class HundredPointWordViewModelTests: XCTestCase {

    let sut = HundredPointWordViewModel()
    
    func test_withText_shouldReturnCorrectValue() {
        sut.wordText = "abcd"
        sut.countPoints()
        XCTAssertEqual(sut.points, 10)
        XCTAssertFalse(sut.showWinner)
    }

    func test_withEmptyText_shouldReturnCorrectValue() {
        sut.wordText = ""
        sut.countPoints()
        XCTAssertEqual(sut.points, 0)
        XCTAssertFalse(sut.showWinner)
    }

    func test_withText_andMoreThanHundredPoints_shouldReturnWinnerBool() {
        sut.wordText = "hundredword"
        sut.countPoints()
        XCTAssertEqual(sut.points, 134)
        XCTAssertTrue(sut.showWinner)
    }
}
