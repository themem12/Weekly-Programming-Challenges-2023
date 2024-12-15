//
//  ColorsViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Saavedra, Guillermo on 10/12/24.
//

import XCTest
@testable import WeeklyChallenges2023

final class ColorsViewModelTests: XCTestCase {

    let sut = ColorsViewModel()

    func test_convertFromHexToRGB_withCorrectValues_shouldReturnCorrectValues() {
        sut.hexText = "FFFFFF"
        sut.convertFromHexToRGB()
        XCTAssertEqual(sut.rgbValue, "255, 255, 255")
        sut.hexText = "000000"
        sut.convertFromHexToRGB()
        XCTAssertEqual(sut.rgbValue, "0, 0, 0")
        sut.hexText = "800080"
        sut.convertFromHexToRGB()
        XCTAssertEqual(sut.rgbValue, "128, 0, 128")
    }

    func test_convertFromRGBToHex_withCorrectValues_shouldReturnCorrectValues() {
        sut.redText = "255"
        sut.greenText = "255"
        sut.blueText = "255"
        sut.convertFromRGBToHex()
        XCTAssertEqual(sut.hexValue, "#FFFFFF")
        sut.redText = "0"
        sut.greenText = "0"
        sut.blueText = "0"
        sut.convertFromRGBToHex()
        XCTAssertEqual(sut.hexValue, "#000000")
        sut.redText = "128"
        sut.greenText = "0"
        sut.blueText = "128"
        sut.convertFromRGBToHex()
        XCTAssertEqual(sut.hexValue, "#800080")
    }

    func test_convertFromHexToRGB_withIncorrectValues_shouldReturnErrors() {
        sut.hexText = "FFFFF"
        sut.convertFromHexToRGB()
        XCTAssertEqual(sut.rgbValue, "Not a valid value")
        
        sut.hexText = "FFFFFFFF"
        sut.convertFromHexToRGB()
        XCTAssertEqual(sut.rgbValue, "Not a valid value")
        
        sut.hexText = "FJFFFF"
        sut.convertFromHexToRGB()
        XCTAssertEqual(sut.rgbValue, "Not a valid value for red")
        
        sut.hexText = "FFFJFJ"
        sut.convertFromHexToRGB()
        XCTAssertEqual(sut.rgbValue, "Not a valid value for green")
        
        sut.hexText = "FFFFFJ"
        sut.convertFromHexToRGB()
        XCTAssertEqual(sut.rgbValue, "Not a valid value for blue")
    }

    func test_convertFromRGBToHex_withIncorrectValues_shouldReturnErrors() {
        sut.redText = "280"
        sut.greenText = "255"
        sut.blueText = "255"
        sut.convertFromRGBToHex()
        XCTAssertEqual(sut.hexValue, "Red value is invalid")
        sut.redText = "255"
        sut.greenText = "-1"
        sut.blueText = "255"
        sut.convertFromRGBToHex()
        XCTAssertEqual(sut.hexValue, "Green value is invalid")
        sut.redText = "255"
        sut.greenText = "255"
        sut.blueText = "1280"
        sut.convertFromRGBToHex()
        XCTAssertEqual(sut.hexValue, "Blue value is invalid")
    }
}
