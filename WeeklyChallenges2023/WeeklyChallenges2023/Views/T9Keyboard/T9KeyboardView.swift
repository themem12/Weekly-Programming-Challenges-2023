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
        VStack(alignment: .leading) {
            HStack {
                TwoLabelButton(
                    buttonTittle: "1",
                    buttonSubTittle: " "
                ) {
                    viewModel.keyPressed(.one)
                }
                TwoLabelButton(
                    buttonTittle: "2",
                    buttonSubTittle: "a b c"
                ) {
                    viewModel.keyPressed(.two)
                }
                TwoLabelButton(
                    buttonTittle: "3",
                    buttonSubTittle: "d e f"
                ) {
                    viewModel.keyPressed(.three)
                }
            }
            HStack {
                TwoLabelButton(
                    buttonTittle: "4",
                    buttonSubTittle: "g h i"
                ) {
                    viewModel.keyPressed(.four)
                }
                TwoLabelButton(
                    buttonTittle: "5",
                    buttonSubTittle: "k j l"
                ) {
                    viewModel.keyPressed(.five)
                }
                TwoLabelButton(
                    buttonTittle: "6",
                    buttonSubTittle: "m n o"
                ) {
                    viewModel.keyPressed(.six)
                }
            }
            HStack {
                TwoLabelButton(
                    buttonTittle: "7",
                    buttonSubTittle: "p q r s"
                ) {
                    viewModel.keyPressed(.seven)
                }
                TwoLabelButton(
                    buttonTittle: "8",
                    buttonSubTittle: "t u v"
                ) {
                    viewModel.keyPressed(.eight)
                }
                TwoLabelButton(
                    buttonTittle: "9",
                    buttonSubTittle: "w x y z"
                ) {
                    viewModel.keyPressed(.nine)
                }
            }
            HStack {
                TwoLabelButton(
                    buttonTittle: "*",
                    buttonSubTittle: ""
                ) {
                    viewModel.keyPressed(.asterisk)
                }
                TwoLabelButton(
                    buttonTittle: "0",
                    buttonSubTittle: " "
                ) {
                    viewModel.keyPressed(.zero)
                }
                TwoLabelButton(
                    buttonTittle: "#",
                    buttonSubTittle: ""
                ) {
                    viewModel.keyPressed(.hashtag)
                }
            }
            Text("Uncoded text:")
                .font(.title)
            Text(viewModel.uncodedText)
            Text("Decoded text:")
                .font(.title)
            Text(viewModel.decodedText)
            Spacer()
            BasicButton(
                buttonTittle: "Reset",
                backgroundColor: .red,
                fontSize: 20
            ) {
                viewModel.reset()
            }
        }.padding(.horizontal)
    }
}

#Preview {
    T9KeyboardView()
}
