//
//  AddsViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Saavedra, Guillermo on 13/12/24.
//

import XCTest
@testable import WeeklyChallenges2023

final class AddsViewModelTests: XCTestCase {

    let sut = AddsViewModel()

    func test_() {
        sut.startSearch()
        XCTAssertEqual(sut.combinations, [[1,5], [1,3,2]])
    }
}
