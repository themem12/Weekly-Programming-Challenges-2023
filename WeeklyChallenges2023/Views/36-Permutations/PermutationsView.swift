//
//  PermutationsView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 14/12/24.
//

import SwiftUI

struct PermutationsView: View {

    @ObservedObject var viewModel = PermutationsViewModel()

    var body: some View {
        VStack {
            TextField("Input", text: $viewModel.wordToPermute)
                .textFieldStyle(OvalTextFieldStyle())
            BasicButton(
                buttonTittle: "Permute",
                backgroundColor: .green
            ) {
                viewModel.startPermutations()
            }
            ScrollView {
                ForEach(viewModel.permutations, id: \.self) { permutation in
                    Text(permutation)
                }
            }
        }
        .padding()
    }
}

#Preview {
    PermutationsView()
}
