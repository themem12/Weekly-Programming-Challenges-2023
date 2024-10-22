//
//  BasicButton.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 21/10/24.
//

import SwiftUI

struct BasicButton: View {
    let action: () -> Void
    let buttonTittle: String
    var backgroundColor: Color = .gray
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text(buttonTittle)
                    .font(.system(size: 32))
                    .foregroundStyle(.white)
                    .bold()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
        }
    }
}

#Preview {
    BasicButton(action: {
        print("Test tapped")
    }, buttonTittle: "Test")
}
