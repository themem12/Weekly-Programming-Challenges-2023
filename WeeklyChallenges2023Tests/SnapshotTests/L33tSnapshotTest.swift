//
//  MenuSnapshotTest.swift
//  WeeklyChallenges2023Tests
//
//  Created by Guillermo Saavedra Dorantes  on 27/02/25.
//

import XCTest
import SnapshotTesting

@testable import WeeklyChallenges2023

final class l33tSnapshotTest: XCTestCase {

    func test_empty_view() throws {
        let view = L33tView()
        assertSnapshot(of: view, as: .image)
    }
}
