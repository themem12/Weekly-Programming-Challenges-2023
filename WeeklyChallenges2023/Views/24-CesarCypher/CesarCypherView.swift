//
//  CesarCypherView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 16/06/23.
//

import SwiftUI

struct CesarCypherView: View {
    @StateObject var viewModel = CesarCypherViewModel()
    var body: some View {
        VStack {
            HStack {
                Button("Cypher") {
                    viewModel.isCypher = true
                }
                .foregroundColor(.white)
                .padding(10)
                .background(Color.red.opacity(viewModel.isCypher ? 1.0 : 0.5))
                .cornerRadius(10)
                Button("Decipher") {
                    viewModel.isCypher = false
                }
                .foregroundColor(.white)
                .padding(10)
                .background(Color.red.opacity(viewModel.isCypher ? 0.5 : 1.0))
                .cornerRadius(10)
            }
            TextField("Give me the text to \(viewModel.isCypher ? "cypher" : "decipher")", text: $viewModel.textFieldString)
                .textFieldStyle(.roundedBorder)
            Text(viewModel.newText)
        }
        .padding()
    }
}

struct CesarCypherView_Previews: PreviewProvider {
    static var previews: some View {
        CesarCypherView()
    }
}
