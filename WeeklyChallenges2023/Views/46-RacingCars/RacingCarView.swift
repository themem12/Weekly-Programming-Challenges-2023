//
//  RacingCarView.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 27/12/24.
//

import SwiftUI

struct RacingCarView: View {

    @ObservedObject var viewModel = RacingCarsViewModel(randomizer: ActualRandomizer())

    var body: some View {
        VStack {
            TextField(text: $viewModel.lengthText) {
                Text("Tracks length")
            }
            .textFieldStyle(OvalTextFieldStyle())
            .keyboardType(.decimalPad)
            BasicButton(
                buttonTittle: "Create tracks",
                backgroundColor: viewModel.didStart ? .gray : .green
            ) {
                viewModel.createTracks()
            }
            ForEach(viewModel.tracks, id: \.self) { track in
                Text(track)
            }
            BasicButton(
                buttonTittle: "Start race",
                backgroundColor: viewModel.didStart ? .gray : .green
            ) {
                viewModel.startRace()
            }
        }
        .padding()
        .alert("Race ended", isPresented: $viewModel.winning.isShown) {
            Button {
                viewModel.winning.isShown = false
                viewModel.createTracks()
            } label: {
                Text(viewModel.winning.message)
            }
        }
        .alert("There was an error:\n \(viewModel.error.message)", isPresented: $viewModel.error.isShown) {
            Button {
                viewModel.error.isShown = false
            } label: {
                Text("Ok")
            }
        }
    }
}

#Preview {
    RacingCarView()
}
