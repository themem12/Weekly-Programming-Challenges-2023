//
//  HauntedHouseViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Guillermo Saavedra Dorantes  on 20/12/24.
//

import XCTest
@testable import WeeklyChallenges2023

final class HauntedHouseViewModelTests: XCTestCase {

    let sut = HauntedHouseViewModel()

    func test_withLiveDelegate_shouldReturn_notEmptyMap_withOneEntryAndOneExit_atInit() {
        XCTAssertEqual(sut.map.count, 4)
        for index in 0..<4 {
            XCTAssertEqual(sut.map[index].count, 4)
        }
        let rowsWithEntranceAndExit = sut.map.map { row in
            row.filter({ $0.type == .entrance || $0.type == .exit })
        }.filter({ $0.count != 0}).count
        XCTAssertTrue(rowsWithEntranceAndExit > 0)
    }

    func test_withLiveDelegate_shouldReturn_differentMap_whenReset() {
        let firstMap = sut.map
        sut.reset()
        XCTAssertFalse(assertEqualMaps(firstMap, sut.map))
    }

    func test_witMockDelegate_shouldReturn_sameMap_whenReset() {
        let viewModel = HauntedHouseViewModel(delegate: MockHauntedHouseRandomizer())
        let firstMap = viewModel.map
        viewModel.reset()
        XCTAssertTrue(assertEqualMaps(firstMap, viewModel.map))
    }

    func test_withCorrectAnswer_shouldMove() {
        let viewModel = HauntedHouseViewModel(delegate: MockHauntedHouseRandomizer())
        viewModel.answerText = "0"
        viewModel.moveToRoom(.west)
        XCTAssertFalse(viewModel.wrongAnswer)
        XCTAssertTrue(viewModel.map[0][1].occupied)
    }

    func test_withCorrectAnswer_andMovedToExit_shouldReturnWin() {
        let viewModel = HauntedHouseViewModel(delegate: MockHauntedHouseRandomizer())
        viewModel.answerText = "0"
        viewModel.moveToRoom(.west)
        XCTAssertFalse(viewModel.wrongAnswer)
        XCTAssertTrue(viewModel.didWin)
    }

    func test_withIncorrectAnswer_shouldNotMove_shouldReturnError() {
        let viewModel = HauntedHouseViewModel(delegate: MockHauntedHouseRandomizer())
        viewModel.answerText = "Error"
        viewModel.moveToRoom(.west)
        XCTAssertTrue(viewModel.wrongAnswer)
        XCTAssertFalse(viewModel.didWin)
        XCTAssertTrue(viewModel.wrongAnswer)
        XCTAssertTrue(viewModel.map[0][0].occupied)
    }

    private func assertEqualMaps(_ first: [[HauntedHouseRoom]], _ second: [[HauntedHouseRoom]]) -> Bool {
        for column in 0..<4 {
            for row in 0..<4 {
                if first[column][row].type != second[column][row].type ||
                first[column][row].occupied != second[column][row].occupied ||
                first[column][row].moves != second[column][row].moves ||
                first[column][row].answers != second[column][row].answers ||
                first[column][row].questions != second[column][row].questions {
                    return false
                }
            }
        }
        return true
    }
}
