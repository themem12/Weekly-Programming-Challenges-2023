//
//  SwitchButton.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 06/03/23.
//

import SwiftUI

struct SwitchButtonInactive: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
                    .padding(12)
                    .background(Color(UIColor.systemIndigo))
                    .foregroundColor(.white)
                    .cornerRadius(8)
    }
}

struct SwitchButtonActive: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
                    .padding(12)
                    .background(Color(UIColor.red))
                    .foregroundColor(.white)
                    .cornerRadius(8)
    }
}
