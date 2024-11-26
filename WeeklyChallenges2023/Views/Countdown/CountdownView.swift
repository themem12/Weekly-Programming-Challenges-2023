//
//  CountdownView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 07/10/24.
//

import SwiftUI

struct CountdownView: View {
    @StateObject var viewModel = CountdownViewModel()
    var body: some View {
        VStack {
            TextField("Give me the number to start", text: $viewModel.startString)
                .textFieldStyle(.roundedBorder)
            TextField("Give me the seconds between steps", text: $viewModel.secondsString)
                .textFieldStyle(.roundedBorder)
            
            BasicButton(buttonTittle: "Start countdown") {
                viewModel.startCountdown()
            }
            
            Image(viewModel.imageName.rawValue)
                .resizable()
                .scaledToFit()
                .hidden(!viewModel.countdownStarted)
            
            Text("\(viewModel.secondsRemaining)")
                .font(.system(size: 60))
                .foregroundColor(.red)
                .hidden(!viewModel.countdownStarted)
        }
        .padding()
        .alert("Error with the values given", isPresented: $viewModel.errorWithValues) {
            Button("Let me change them", role: .cancel) {
                viewModel.reset()
            }
        }
        .alert("Boom", isPresented: $viewModel.isExploded) {
            Button("OUCH", role: .cancel) {
                viewModel.reset()
            }
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
