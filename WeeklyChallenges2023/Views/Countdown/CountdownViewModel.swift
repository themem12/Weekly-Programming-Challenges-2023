//
//  CountdownViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 07/10/24.
//

import Foundation

final class CountdownViewModel: ObservableObject {
    
    public enum ImageNames: String {
        case bowserHead = "Bowser_Head"
        case explosion = "Explosion"
    }
    
    @Published var startString: String = ""
    @Published var secondsString: String = ""
    @Published var secondsRemaining: Int = 0
    @Published var countdownStarted: Bool = false
    @Published var isExploded: Bool = false
    @Published var errorWithValues: Bool = false
    
    private(set) var imageName: ImageNames = .bowserHead
    
    private var timer: Timer? = nil
    
    public func startCountdown() {
        guard let start = Int(startString) else {
            errorWithValues = true
            return
        }
        guard let seconds = Int(secondsString) else {
            errorWithValues = true
            return
        }
        countdownStarted = true
        var remaining = start
        self.secondsRemaining = remaining
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(seconds), repeats: true) { [self] _ in
            remaining -= 1
            self.secondsRemaining = remaining
            if remaining <= 0 {
                self.imageName = .explosion
                self.isExploded = true
                self.timer?.invalidate()
                self.timer = nil
            }
        }
    }
    
    public func reset() {
        imageName = .bowserHead
        countdownStarted = false
        secondsRemaining = 0
        isExploded = false
        errorWithValues = false
        startString = ""
        secondsString = ""
    }
}
