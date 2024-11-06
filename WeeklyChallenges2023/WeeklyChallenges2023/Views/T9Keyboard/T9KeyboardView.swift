//
//  T9KeyboardView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 02/11/24.
//

import SwiftUI

struct T9KeyboardView: View {
    @StateObject var viewModel = T9KeyboardViewModel()
    var body: some View {
        VStack {
            HStack {
                BasicButton(buttonTittle: "1") {
                    viewModel.keyPressed(.one)
                }
                BasicButton(buttonTittle: "2") {
                    viewModel.keyPressed(.two)
                }
                BasicButton(buttonTittle: "3") {
                    viewModel.keyPressed(.three)
                }
            }
            HStack {
                BasicButton(buttonTittle: "4") {
                    viewModel.keyPressed(.four)
                }
                BasicButton(buttonTittle: "5") {
                    viewModel.keyPressed(.five)
                }
                BasicButton(buttonTittle: "6") {
                    viewModel.keyPressed(.six)
                }
            }
            HStack {
                BasicButton(buttonTittle: "7") {
                    viewModel.keyPressed(.seven)
                }
                BasicButton(buttonTittle: "8") {
                    viewModel.keyPressed(.eight)
                }
                BasicButton(buttonTittle: "9") {
                    viewModel.keyPressed(.nine)
                }
            }
            Text(viewModel.text)
        }
    }
}

#Preview {
    T9KeyboardView()
}
