//
//  AddsView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 14/12/24.
//

import SwiftUI

struct AddsView: View {

    @ObservedObject var viewModel = AddsViewModel()

    var body: some View {
        VStack {
            TextField(
                "Numbers array",
                text: $viewModel.numbersText
            )
            .textFieldStyle(OvalTextFieldStyle())
            .keyboardType(.decimalPad)

            TextField(
                "Target",
                text:$viewModel.targetText
            )
            .textFieldStyle(OvalTextFieldStyle())
            .keyboardType(.decimalPad)

            BasicButton(
                buttonTittle: "Get sums",
                backgroundColor: .green
            ) {
                viewModel.startSearch()
            }

            ScrollView {
                ForEach($viewModel.combinations, id: \.self) { combination in
                    Text("\(combination.wrappedValue)")
                }
            }
        }.padding()
    }
}

#Preview {
    AddsView()
}
