//
//  BasicButton.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 21/10/24.
//

import SwiftUI

struct BasicButton: View {
    
    let buttonTittle: String
    var backgroundColor: Color = .gray
    var fontSize: CGFloat = 32
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Text(buttonTittle)
                    .font(.system(size: fontSize))
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
    BasicButton(buttonTittle: "Test", action: {
        print("Test tapped")
    })
}
