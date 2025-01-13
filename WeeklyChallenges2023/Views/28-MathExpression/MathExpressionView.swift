//
//  MathExpressionView.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 22/10/24.
//

import SwiftUI

struct MathExpressionView: View {
    @StateObject var viewModel = MathExpressionViewModel()
    
    var body: some View {
        VStack {
            TextField("Math expression", text: $viewModel.fieldText)
                .textFieldStyle(OvalTextFieldStyle())
            BasicButton(
                buttonTittle: viewModel.validatorTitle,
                backgroundColor: viewModel.validatorColor
            ) {}
        }.padding()
    }
}

#Preview {
    MathExpressionView()
}
