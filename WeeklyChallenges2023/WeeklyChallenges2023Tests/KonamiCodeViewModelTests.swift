//
//  KonamiCodeViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Guillermo Saavedra Dorantes  on 07/10/24.
//

import XCTest
@testable import WeeklyChallenges2023

final class KonamiCodeViewModelTests: XCTestCase {
    
    let sut = KonamiCodeViewModel()

    func test_withCorrectCode_didEnteredCorrectly_shouldBeTrue() {
        sut.buttonTapped(.up)
        sut.buttonTapped(.up)
        sut.buttonTapped(.down)
        sut.buttonTapped(.down)
        sut.buttonTapped(.left)
        sut.buttonTapped(.right)
        sut.buttonTapped(.left)
        sut.buttonTapped(.right)
        sut.buttonTapped(.b)
        sut.buttonTapped(.a)

        XCTAssertTrue(sut.didEnteredCorrectly)
    }
    
    func test_withIncorrectCode_didEnteredCorrectly_shouldBeFalse() {
        sut.buttonTapped(.down)
        sut.buttonTapped(.up)
        sut.buttonTapped(.down)
        sut.buttonTapped(.down)
        sut.buttonTapped(.left)
        sut.buttonTapped(.right)
        sut.buttonTapped(.left)
        sut.buttonTapped(.right)
        sut.buttonTapped(.b)
        sut.buttonTapped(.a)

        XCTAssertFalse(sut.didEnteredCorrectly)
    }
    
    func test_withIncompleteCode_didEnteredCorrectly_shouldBeFalse() {
        sut.buttonTapped(.down)
        sut.buttonTapped(.up)
        sut.buttonTapped(.down)
        sut.buttonTapped(.down)
        sut.buttonTapped(.left)

        XCTAssertFalse(sut.didEnteredCorrectly)
    }
}
