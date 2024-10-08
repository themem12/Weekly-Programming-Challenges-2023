//
//  KonamiCodeViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 06/10/24.
//
// Konami Code Up, up, down, down, left, right, left, right, B, A

import Foundation

public enum ControllerButtonType: String {
    case up = "up"
    case down = "down"
    case right = "right"
    case left = "left"
    case select = "select"
    case start = "start"
    case a = "a"
    case b = "b"
}

final class KonamiCodeViewModel: ObservableObject {
    private let konamiCodeCount: Int = 10
    private let konamiCode: [ControllerButtonType] = [
        .up,
        .up,
        .down,
        .down,
        .left,
        .right,
        .left,
        .right,
        .b,
        .a
    ]
    @Published var didEnteredCorrectly: Bool = false
    private var buttonsTapped: [ControllerButtonType] = []
    
    public func buttonTapped(_ type: ControllerButtonType) {
        print("Button tapped: \(type.rawValue)")
        addButtonTapped(type)
        validateCode()
    }
    
    public func resetCode() {
        didEnteredCorrectly = false
        buttonsTapped = []
    }
    
    private func addButtonTapped(_ type: ControllerButtonType) {
        buttonsTapped.append(type)
        guard buttonsTapped.count > konamiCodeCount else { return }
        _ = buttonsTapped.removeFirst()
    }
    
    private func validateCode() {
        guard buttonsTapped.count == konamiCodeCount else {
            didEnteredCorrectly = false
            print("NO: validateCode")
            return
        }
        for index in 0..<buttonsTapped.count {
            if buttonsTapped[index] != konamiCode[index] {
                didEnteredCorrectly = false
                print("NO: validateCode for")
                return
            }
        }
        didEnteredCorrectly = true
        print("SI")
    }
}
