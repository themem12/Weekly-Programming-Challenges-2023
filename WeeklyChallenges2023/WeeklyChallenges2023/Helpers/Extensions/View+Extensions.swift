//
//  View+Extensions.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 21/10/24.
//

import SwiftUI

public extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
