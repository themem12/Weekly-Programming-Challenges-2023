//
//  WeatherSimulatorView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 18/12/24.
//

import SwiftUI

struct WeatherSimulatorView: View {
    @ObservedObject var viewModel = WeatherSimulatorViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Temperature", text: $viewModel.initialTempText)
                    .textFieldStyle(OvalTextFieldStyle())
                TextField("Rain percentage", text: $viewModel.initialRainPercentageText)
                    .textFieldStyle(OvalTextFieldStyle())
                TextField("Days", text: $viewModel.numberOfDaysText)
                    .textFieldStyle(OvalTextFieldStyle())
            }
            BasicButton(
                buttonTittle: "Simulate",
                backgroundColor: .green
            ) {
                viewModel.startSimulation()
            }
            Text("Max temperature: \(viewModel.maxTemperature)")
                .font(.title2)
            Text("Min temperature: \(viewModel.minTemperature)")
                .font(.title2)
            Text("Rainig days: \(viewModel.rainingDays)")
                .font(.title2)
            ScrollView {
                ForEach(viewModel.weatherPrediction) { prediction in
                    Text("Temperature prediction: \(prediction.temperature), will it rain? \(prediction.rain)")
                }
            }
        }.padding()
    }
}

#Preview {
    WeatherSimulatorView()
}
