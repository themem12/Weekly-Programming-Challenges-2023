//
//  RacingCarsViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Saavedra, Guillermo on 27/12/24.
//

import XCTest
@testable import WeeklyChallenges2023

final class RacingCarsViewModelTests: XCTestCase {

    var sut: RacingCarsViewModel!
    var randomizer: MockRandomizer!
    
    override func setUp() {
        super.setUp()
        randomizer = MockRandomizer()
        sut = RacingCarsViewModel(randomizer: randomizer)
    }
    
    func test_createTracks_shouldReturnTwoTracks() {
        sut.lengthText = "10"
        XCTAssertEqual(sut.tracks, ["", ""])
        sut.createTracks()
        XCTAssertEqual(sut.tracks[0].count, 10)
        XCTAssertEqual(sut.tracks[1].count, 10)
    }

    func test_startRace() {
        sut.lengthText = "5"
        randomizer.intValue = 3
        sut.createTracks()
        sut.startRace()
        XCTAssertTrue(sut.didStart)
    }

}
