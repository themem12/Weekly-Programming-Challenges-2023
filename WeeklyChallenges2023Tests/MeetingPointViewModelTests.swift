//
//  MeetingPointViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Saavedra, Guillermo on 31/12/24.
//

import XCTest
@testable import WeeklyChallenges2023

final class MeetingPointViewModelTests: XCTestCase {

    let sut = MeetingPointViewModel()
    
    func test_withCrossingLinesValues_shouldReturn_results() {
        sut.xiLineAText = "1"
        sut.yiLineAText = "3"
        sut.xfLineAText = "2"
        sut.yfLineAText = "-5"
        
        sut.xiLineBText = "-1"
        sut.yiLineBText = "2"
        sut.xfLineBText = "2"
        sut.yfLineBText = "-5"

        sut.getPoint()

        XCTAssertEqual(sut.firstLine?.equation, "y=-8.0x+11.0")
        XCTAssertEqual(sut.firstLine?.m, -8.0)
        XCTAssertEqual(sut.firstLine?.b, 11.0)
        XCTAssertEqual(sut.secondLine?.equation, "y=-2.3333333x-0.33333334")
        XCTAssertEqual(sut.secondLine?.m, -2.3333333)
        XCTAssertEqual(sut.secondLine?.b, -0.33333334)

        XCTAssertEqual(sut.xMeetingPoint, "x: 1.9999999")
        XCTAssertEqual(sut.yMeetingPoint, "y: -4.999999")
    }

    func test_withPerpendicularLinesValues_shouldReturn_results() {
        sut.xiLineAText = "-2"
        sut.yiLineAText = "3"
        sut.xfLineAText = "2"
        sut.yfLineAText = "3"
        
        sut.xiLineBText = "-2"
        sut.yiLineBText = "2"
        sut.xfLineBText = "2"
        sut.yfLineBText = "2"

        sut.getPoint()

        XCTAssertEqual(sut.firstLine?.equation, "y=0.0x+3.0")
        XCTAssertEqual(sut.firstLine?.m, 0.0)
        XCTAssertEqual(sut.firstLine?.b, 3.0)
        XCTAssertEqual(sut.secondLine?.equation, "y=0.0x+2.0")
        XCTAssertEqual(sut.secondLine?.m, 0.0)
        XCTAssertEqual(sut.secondLine?.b, 2.0)

        XCTAssertTrue(sut.error)
        XCTAssertEqual(sut.errorMessage, "Lines won't meet")
    }

}
