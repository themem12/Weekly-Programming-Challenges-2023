//
//  InfiltratedCharacterView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 02/11/24.
//

import SwiftUI

struct InfiltratedCharacterView: View {
    @StateObject var viewModel = InfiltratedCharacterViewModel()
    var body: some View {
        VStack {
            TextField("First String", text: $viewModel.firstFieldString)
                .textFieldStyle(OvalTextFieldStyle())
            TextField("Second String", text: $viewModel.secondFieldString)
                .textFieldStyle(OvalTextFieldStyle())
            BasicButton(
                buttonTittle: "Validate",
                backgroundColor: .green,
                fontSize: 16
            ) {
                viewModel.validateStrings()
            }
            Text("Characters Infiltrated")
            ScrollView {
                ForEach(0..<viewModel.infiltratedCharacters.count, id: \.self) { index in
                    HStack {
                        Spacer()
                        Text(viewModel.infiltratedCharacters[index])
                        Spacer()
                    }.padding(.vertical, 4)
                }
            }
        }
        .padding()
    }
}

#Preview {
    InfiltratedCharacterView()
}
