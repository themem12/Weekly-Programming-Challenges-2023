//
//  ExcelColumnViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Saavedra, Guillermo on 25/11/24.
//

import XCTest
@testable import WeeklyChallenges2023

final class ExcelColumnViewModelTests: XCTestCase {

    let sut = ExcelColumnViewModel()

    func test_withUppercasedValues_shouldReturnCorrectNumber() {
        sut.getColumnNumber(column: "A")
        XCTAssertEqual(sut.columnNumber, 1)
        XCTAssertNil(sut.errorString)
        
        sut.getColumnNumber(column: "Z")
        XCTAssertEqual(sut.columnNumber, 26)
        XCTAssertNil(sut.errorString)
        
        sut.getColumnNumber(column: "AA")
        XCTAssertEqual(sut.columnNumber, 27)
        XCTAssertNil(sut.errorString)
        
        sut.getColumnNumber(column: "CA")
        XCTAssertEqual(sut.columnNumber, 79)
        XCTAssertNil(sut.errorString)
    }
    
    func test_withDownCasedValues_shouldReturnCorrectNumber() {
        sut.getColumnNumber(column: "a")
        XCTAssertEqual(sut.columnNumber, 1)
        XCTAssertNil(sut.errorString)
        
        sut.getColumnNumber(column: "z")
        XCTAssertEqual(sut.columnNumber, 26)
        XCTAssertNil(sut.errorString)
        
        sut.getColumnNumber(column: "aa")
        XCTAssertEqual(sut.columnNumber, 27)
        XCTAssertNil(sut.errorString)
        
        sut.getColumnNumber(column: "ca")
        XCTAssertEqual(sut.columnNumber, 79)
        XCTAssertNil(sut.errorString)
    }
    
    func test_withOnlyInvalidCharacters_shouldReturnZero() {
        sut.getColumnNumber(column: "!@()[]")
        XCTAssertEqual(sut.columnNumber, 0)
        XCTAssertEqual(sut.errorString, "Invalid value")
        
        sut.getColumnNumber(column: "AA!@B(Z)")
        XCTAssertEqual(sut.columnNumber, 0)
        XCTAssertEqual(sut.errorString, "Invalid value")
    }
}
