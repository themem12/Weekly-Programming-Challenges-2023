//
//  MathQuizView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 18/12/24.
//

import SwiftUI

struct MathQuizView: View {

    @ObservedObject var viewModel = MathQuizViewModel()

    var body: some View {
        VStack {
            Text("Seconds remaining: \(viewModel.secondsRemaining)")
                .font(.title)
            Text("Points: \(viewModel.points)")
                .font(.title)
            Text(viewModel.question)
                .font(.largeTitle)
            TextField("Set answer", text: $viewModel.answerText)
                .textFieldStyle(OvalTextFieldStyle())
                .keyboardType(.numberPad)
            BasicButton(buttonTittle: viewModel.isQuizStarted ? "SendAnswer" : "Start quiz") {
                if viewModel.isQuizStarted {
                    viewModel.respond()
                } else {
                    viewModel.startQuiz()
                }
            }
        }
    }
}

#Preview {
    MathQuizView()
}
