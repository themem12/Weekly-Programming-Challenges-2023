//
//  TwoLabelButton.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 10/11/24.
//

import SwiftUI

struct TwoLabelButton: View {
    
    let buttonTittle: String
    let buttonSubTittle: String
    var backgroundColor: Color = .gray
    var titleSize: CGFloat = 32
    var subtitleSize: CGFloat = 16
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Text(buttonTittle)
                    .font(.system(size: titleSize))
                    .foregroundStyle(.white)
                    .bold()
                Text(buttonSubTittle)
                    .font(.system(size: subtitleSize))
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
    TwoLabelButton(
        buttonTittle: "Title",
        buttonSubTittle: "Subtitle"
    ) {
        print("TwoLabelButton pressed")
    }
}
