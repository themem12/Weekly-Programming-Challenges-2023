//
//  TennisGameView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 09/03/23.
//

import SwiftUI

struct TennisGameView: View {
    @StateObject var viewModel = TennisGameViewModel()
    var body: some View {
        VStack {
            Text("Partido: \(viewModel.gameNumber)")
                .font(.title)
                .bold()
                .padding(.top)
            HStack {
                VStack {
                    Text("Jugador 1")
                        .foregroundColor(.gray)
                    Text(viewModel.playerOnePoints.getText())
                        .padding(.top, 32)
                        .font(.title3)
                        .bold()
                }
                .padding(.trailing, 64)
                VStack {
                    Text("Jugador 2")
                        .foregroundColor(.gray)
                    Text(viewModel.playerTwoPoints.getText())
                        .padding(.top, 32)
                        .font(.title3)
                        .bold()
                }
            }
            .padding(.top, 24)
            
            HStack(spacing: 32) {
                Button("Punto jugador 1") {
                    viewModel.playerOneAddPoint()
                }
                Button("Punto jugador 2") {
                    viewModel.playerTwoAddPoint()
                }
            }
            .padding(.top, 48)
            
            Button("Reiniciar partido") {
                viewModel.resetGame()
            }
            .padding([.top, .bottom], 24)
            
            HStack {
                Text("Historial de juegos")
                    .padding(.leading, 8)
                Spacer()
            }
            
            List(viewModel.gamesStories) { game in
                VStack(alignment: .leading, spacing: 8) {
                    Text("Partido: \(game.id)")
                        .foregroundColor(.gray)
                    HStack(spacing: 64) {
                        Text("Jugador 1: \(game.player1Score.getText())")
                        Text("Jugador 2: \(game.player2Score.getText())")
                    }.padding(.leading, 8)
                }
            }
        }.alert("Partido terminado", isPresented: $viewModel.finishedGame) {
            Button {
                viewModel.resetGame()
            } label: {
                Text("Nuevo partido")
            }
        }

    }
}

struct TennisGameView_Previews: PreviewProvider {
    static var previews: some View {
        TennisGameView()
    }
}
