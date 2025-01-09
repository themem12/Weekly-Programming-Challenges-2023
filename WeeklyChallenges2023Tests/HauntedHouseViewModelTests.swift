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

    func test_() {
        sut.createMap()
        XCTAssertEqual(sut.map, [])
    }
}
