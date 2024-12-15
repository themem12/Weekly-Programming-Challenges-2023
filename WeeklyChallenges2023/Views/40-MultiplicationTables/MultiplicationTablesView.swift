//
//  MultiplicationTablesView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 15/12/24.
//

import SwiftUI

struct MultiplicationTablesView: View {

    @ObservedObject var viewModel = MultiplicationTablesViewModel()

    var body: some View {
        VStack {
            TextField("Enter number", text: $viewModel.numberText)
                .textFieldStyle(OvalTextFieldStyle())
                .keyboardType(.numberPad)

            BasicButton(buttonTittle: "Get table") {
                viewModel.getMultiplicationTable()
            }

            ScrollView {
                ForEach(viewModel.multiplicationTable, id: \.self) { row in
                    Text(row)
                        .font(.title)
                }
            }
        }.padding()
    }
}

#Preview {
    MultiplicationTablesView()
}
