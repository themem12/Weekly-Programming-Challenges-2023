//
//  AdventCalendarViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Saavedra, Guillermo on 18/12/24.
//

import XCTest
@testable import WeeklyChallenges2023

final class AdventCalendarViewModelTests: XCTestCase {

    let sut = AdventCalendarViewModel()
    private let mockList: [String] = [
        "Guillermo",
        "Frida",
        "Gustavo",
        "Luis"
    ]

    func test_withNoEmptyName_andNameNotInList_shouldSave() {
        sut.nameText = "Guillermo"
        sut.saveNameTapped()
        XCTAssertEqual(sut.list, ["Guillermo"])
        XCTAssertNil(sut.error)
    }

    func test_withNoEmptyName_andNameInList_shouldDelete() {
        sut.list = mockList
        sut.nameText = "Guillermo"
        sut.deleteNameTapped()
        let newList = Array(mockList.dropFirst())
        XCTAssertEqual(sut.list, newList)
        XCTAssertNil(sut.error)
    }

    func test_withList_shouldReturnName_forStartLottery() {
        sut.list = ["Guillermo"]
        sut.startLottery()
        XCTAssertEqual(sut.list, [])
        XCTAssertEqual(sut.winner, "Guillermo")
        XCTAssertNil(sut.error)
        XCTAssertTrue(sut.showWinnerAlert)
    }

    func test_withNoEmptyName_andNameInList_shouldNotSave_andReturnError() {
        sut.list = mockList
        sut.nameText = "Guillermo"
        sut.saveNameTapped()
        XCTAssertEqual(sut.list, mockList)
        XCTAssertEqual(sut.error, "Name already in list")
        XCTAssertTrue(sut.showErrorAlert)
    }

    func test_withNoEmptyName_andNameNotInList_shouldNotDelete_andReturnError() {
        sut.list = mockList
        sut.nameText = "Chino"
        sut.deleteNameTapped()
        XCTAssertEqual(sut.list, mockList)
        XCTAssertEqual(sut.error, "Name not found in list")
        XCTAssertTrue(sut.showErrorAlert)
    }

    func test_withEmptyName_shouldReturnError_whileSavingOrDeleting() {
        sut.nameText = ""
        sut.saveNameTapped()
        XCTAssertEqual(sut.error, "Name text is empty")
        XCTAssertTrue(sut.showErrorAlert)
        sut.showErrorAlert = false
        sut.deleteNameTapped()
        XCTAssertEqual(sut.error, "Name text is empty")
        XCTAssertTrue(sut.showErrorAlert)
    }

    func test_withEmptyList_shouldReturnError_forStartLottery() {
        sut.list = []
        sut.startLottery()
        XCTAssertEqual(sut.error, "List is empty")
        XCTAssertTrue(sut.showErrorAlert)
    }
}
