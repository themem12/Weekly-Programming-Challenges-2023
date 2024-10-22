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
            BasicButton(action: {
                print("Basic Button tapped")
            }, buttonTittle: "BasicButton"
            , backgroundColor: .red)
        }
    }
}

#Preview {
    ButtonsExampleView()
}
