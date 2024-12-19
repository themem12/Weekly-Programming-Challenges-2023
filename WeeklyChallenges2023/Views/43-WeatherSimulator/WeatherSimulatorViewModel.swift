//
//  WeatherSimulatorViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 17/12/24.
//

import Foundation

struct WeatherSimulatorPredictions: Identifiable {
    let id = UUID()
    let temperature: Int
    let rain: Bool
}

final class WeatherSimulatorViewModel: ObservableObject {
    @Published var initialTempText: String = ""
    @Published var initialRainPercentageText: String = ""
    @Published var numberOfDaysText: String = ""
    @Published var weatherPrediction: [WeatherSimulatorPredictions] = []
    @Published var maxTemperature: Int = 0
    @Published var minTemperature: Int = 0
    @Published var rainingDays: Int = 0

    public func startSimulation() {
        guard let initialTemp = Int(initialTempText) else { return }
        guard let initialRainPercentage = Int(initialRainPercentageText) else { return }
        guard let numberOfDays = Int(numberOfDaysText) else { return }
        maxTemperature = initialTemp
        minTemperature = initialTemp
        weatherPrediction = []
        simulateWeather(temp: initialTemp, rainPercentage: initialRainPercentage, remainingDays: numberOfDays)
    }

    private func simulateWeather(temp: Int, rainPercentage: Int, remainingDays: Int) {
        guard remainingDays > 0 else { return }
        var changingTemp = 0
        let tempChangePercentage = Int.random(in: 0...10)
        if tempChangePercentage == 1 {
            changingTemp = 2
        } else if tempChangePercentage == 2 {
            changingTemp = -2
        }
        var newTemp = temp + changingTemp
        var newRainPercentage = rainPercentage
        var willRain: Bool = false
        if newTemp > 25 {
            newRainPercentage += 20
        } else if newTemp < 5 {
            newRainPercentage -= 20
        }
        if newRainPercentage >= 100 {
            willRain = true
            rainingDays += 1
            newTemp -= 1
        }
        if newTemp > maxTemperature {
            maxTemperature = newTemp
        }
        if newTemp < minTemperature {
            minTemperature = newTemp
        }
        weatherPrediction.append(WeatherSimulatorPredictions(temperature: newTemp, rain: willRain))
        simulateWeather(temp: newTemp, rainPercentage: newRainPercentage, remainingDays: remainingDays - 1)
    }
}
