//
//  HundredPointWordView.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 18/12/24.
//

import SwiftUI

struct HundredPointWordView: View {

    @ObservedObject var viewModel = HundredPointWordViewModel()

    var body: some View {
        VStack {
            TextField("Give me the word:", text: $viewModel.wordText)
                .textFieldStyle(OvalTextFieldStyle())
            BasicButton(buttonTittle: "Count points") {
                viewModel.countPoints()
            }
            Text(String(viewModel.points))
                .font(.title)
        }
        .padding()
        .alert("Winner word", isPresented: $viewModel.showWinner) {
            Button("Go") {
                viewModel.showWinner = false
                viewModel.wordText = ""
                viewModel.points = 0
            }
        }

    }
}

#Preview {
    HundredPointWordView()
}
