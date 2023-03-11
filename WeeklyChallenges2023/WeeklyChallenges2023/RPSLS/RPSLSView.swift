//
//  RPSLSView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 07/03/23.
//

import SwiftUI

struct RPSLSView: View {
    @StateObject private var viewModel = RPSLSViewModel()
    var body: some View {
        VStack {
            Toggle("Activar 2 jugadores", isOn: $viewModel.twoPlayersActive)
            Spacer()
            Text(viewModel.playerString)
                .font(.title)
                .bold()
                .foregroundColor(Color.gray)
            HStack {
                ForEach(0..<viewModel.options.count, id: \.self) { index in
                    Button {
                        if viewModel.twoPlayersActive {
                            if viewModel.playerOne == nil {
                                viewModel.playerOne = viewModel.options[index]
                            } else {
                                viewModel.playerTwo = viewModel.options[index]
                            }
                        } else {
                            viewModel.playerOne = viewModel.options[index]
                        }
                    } label: {
                        Text(viewModel.options[index].name.rawValue)
                            .font(.title2)
                    }
                    .frame(width: 50, height: 50)
                    .padding(10)
                    .background(Color.gray)
                    .cornerRadius(10)
                }
            }.padding(10)
            Text(viewModel.gameString)
            Spacer()
        }.padding(10)
    }
}

struct RPSLSView_Previews: PreviewProvider {
    static var previews: some View {
        RPSLSView()
    }
}
