//
//  ButtonsExampleView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 21/10/24.
//

import SwiftUI

struct ButtonsExampleView: View {
    var body: some View {
        VStack {
            BasicButton(
                buttonTittle: "BasicButton",
                backgroundColor: .red
            ) {
                print("Basic Button tapped")
            }
            TwoLabelButton(
                buttonTittle: "Title",
                buttonSubTittle: "Subtitle",
                backgroundColor: .blue
            ) {
                print("Two Label Button tapped")
            }
        }
    }
}

#Preview {
    ButtonsExampleView()
}
