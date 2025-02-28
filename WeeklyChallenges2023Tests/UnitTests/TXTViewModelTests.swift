//
//  TXTViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Guillermo Saavedra Dorantes  on 08/12/24.
//

import XCTest

@testable import WeeklyChallenges2023

final class TXTViewModelTests: XCTestCase {

    let sut = TXTViewModel()

    override func setUp() {
        super.setUp()
        sut.deleteText()
    }

    func test_saveButtonTapped_shouldSaveText_andRetrieve() {
        sut.fieldText = "Hello World"
        sut.saveText()
        XCTAssertEqual(sut.txtContent, "Hello World\n")
    }

    func test_saveButtonTapped_multipleTimes_shouldSaveCompleteText_andRetrieve() {
        sut.fieldText = "Hello World"
        for _ in 0..<5 {
            sut.saveText()
        }
        XCTAssertEqual(sut.txtContent, "Hello World\nHello World\nHello World\nHello World\nHello World\n")
    }

    func test_deleteButtonTapped_shouldDeleteText_andRetrieveEmpty() {
        sut.fieldText = "Hello World"
        sut.saveText()
        XCTAssertEqual(sut.txtContent, "Hello World\n")
        sut.deleteText()
        XCTAssertEqual(sut.txtContent, "")
    }
}
