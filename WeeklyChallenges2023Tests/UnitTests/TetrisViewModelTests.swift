//
//  TetrisViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Guillermo Saavedra Dorantes  on 07/12/24.
//

import XCTest
@testable import WeeklyChallenges2023

final class TetrisViewModelTests: XCTestCase {

    let sut = TetrisViewModel()

    func test_moveUp_onTop_doesNothing() {
        sut.moveUP()
        XCTAssertEqual(sut.board, TetrisMovesMock.initialBoard)
    }

    func test_moveLeft_shouldChangeBoard() {
        sut.moveLeft()
        XCTAssertEqual(sut.board, TetrisMovesMock.moveLeftBoard)
    }

    func test_moveRight_shouldChangeBoard() {
        sut.moveRight()
        XCTAssertEqual(sut.board, TetrisMovesMock.moveRightBoard)
    }

    func test_moveUp_fromMiddle_shouldChangeBoard() {
        sut.moveDown()
        sut.moveDown()
        sut.moveDown()
        sut.moveDown()

        XCTAssertEqual(sut.board, TetrisMovesMock.moveMiddleBoard)
        sut.moveUP()
        XCTAssertEqual(sut.board, TetrisMovesMock.moveUpFromMiddleBoard)
    }

    func test_moveToRight_cannotMovePassEndOfBoard() {
        for _ in 0..<11 {
            sut.moveRight()
        }
        XCTAssertEqual(sut.board, TetrisMovesMock.moveEndRightBoard)
    }

    func test_moveToLeft_cannotMovePassEndOfBoard() {
        for _ in 0..<11 {
            sut.moveLeft()
        }
        XCTAssertEqual(sut.board, TetrisMovesMock.moveLeftBoard)
    }

    func test_moveToBottom_cannotMovePassEndOfBoard() {
        for _ in 0..<11 {
            sut.moveDown()
        }
        XCTAssertEqual(sut.board, TetrisMovesMock.moveBottomBoard)
    }
}
