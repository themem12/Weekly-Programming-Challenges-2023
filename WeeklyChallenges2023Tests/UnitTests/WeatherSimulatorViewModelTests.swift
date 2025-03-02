//
//  WeatherSimulatorViewModelTests.swift
//  WeeklyChallenges2023Tests
//
//  Created by Guillermo Saavedra Dorantes  on 18/12/24.
//

import XCTest
@testable import WeeklyChallenges2023

final class WeatherSimulatorViewModelTests: XCTestCase {

    let sut = WeatherSimulatorViewModel()
    
    func test_withValues_shouldReturn_predictionList() {
        sut.initialTempText = "20"
        sut.initialRainPercentageText = "39"
        sut.numberOfDaysText = "5"
        sut.startSimulation()
        XCTAssertEqual(sut.weatherPrediction.count, 5)
    }

}
