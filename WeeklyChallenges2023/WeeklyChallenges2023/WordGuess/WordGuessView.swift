//
//  WordGuessView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 12/04/23.
//

import SwiftUI

struct WordGuessView: View {
    @StateObject var viewModel = WordGuessViewModel()
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Vidas:")
                
                TextField(text: $viewModel.livesString) {
                    Text("")
                }
                .frame(width: 5)
                .fixedSize(horizontal: true, vertical: false)
                
                Spacer()
            }
            
            TextField(text: $viewModel.guessWordString) {
                Text("")
            }
            .frame(width: 90)
            .fixedSize(horizontal: true, vertical: false)
            
            TextField(text: $viewModel.letterGuessField) {
                Text("Dame una letra")
            }
            .frame(width: 150)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .fixedSize(horizontal: true, vertical: false)
            
            HStack {
                TextField(text: $viewModel.wordGuessField) {
                    Text("Dame la palabra")
                }
                .frame(width: 200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .fixedSize(horizontal: true, vertical: false)
                
                Button {
                    viewModel.guessWord()
                } label: {
                    Text("Adivinar")
                }
            }
            
            Button {
                viewModel.resetGame()
            } label: {
                Text("Nueva palabra")
            }
        }
        .alert("Haz ganado", isPresented: $viewModel.winGame) {
            Button("Nuevo juego", role: .cancel) {
                viewModel.resetGame()
            }
        }
        .alert("Haz perdido", isPresented: $viewModel.loseGame) {
            Button("Nuevo juego", role: .cancel) {
                viewModel.resetGame()
            }
        }
        .padding()
    }
}

struct WordGuessView_Previews: PreviewProvider {
    static var previews: some View {
        WordGuessView()
    }
}
