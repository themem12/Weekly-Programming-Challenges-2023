//
//  RacingCarsViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 27/12/24.
//

import Foundation

struct Alert {
    var isShown: Bool = false
    var message: String = ""
}

protocol RandomizerProtocol {
    func randomInt(from: Int, to: Int) -> Int
}

class ActualRandomizer: RandomizerProtocol {
    func randomInt(from: Int = 0, to: Int = 10) -> Int {
        Int.random(in: from...to)
    }
}

class MockRandomizer: RandomizerProtocol {

    var intValue = 0

    func randomInt(from: Int, to: Int) -> Int {
        intValue
    }
}

final class RacingCarsViewModel: ObservableObject {
    @Published var tracks: [String] = ["", ""]
    @Published var lengthText: String = ""
    @Published var error: Alert = Alert()
    @Published var winning: Alert = Alert()
    @Published var didStart: Bool = false
    
    private var firstTrack = "" {
        didSet {
            tracks[0] = firstTrack
        }
    }
    private var secondTrack = "" {
        didSet {
            tracks[1] = secondTrack
        }
    }
    private var randomizer: RandomizerProtocol
    private var timer: Timer?

    init(randomizer: RandomizerProtocol) {
        self.randomizer = randomizer
    }

    public func createTracks() {
        firstTrack = ""
        secondTrack = ""
        guard let length = Int(lengthText) else {
            error.isShown = true
            error.message = "Not a number"
            return
        }
        guard length > 4 else {
            error.isShown = true
            error.message = "Tracks needs to be at least 5 in length"
            return
        }
        var newTrack = ""
        for _ in 0..<randomizer.randomInt(from: 1, to: 3) {
            newTrack.append("🌲")
        }
        for _ in 0..<length - newTrack.count - 2 {
            newTrack.append("_")
        }
        buildTrack(&firstTrack, with: newTrack, isFirst: true)
        buildTrack(&secondTrack, with: newTrack, isFirst: false)
    }

    public func startRace() {
        didStart = true
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [self] _ in
            guard !winning.isShown else {
                timer?.invalidate()
                timer = nil
                didStart = false
                return
            }
            turn()
        }
    }

    private func turn() {
        let spaces = randomizer.randomInt(from: 1, to: 3)
        moveCar(for: &firstTrack, spaces: spaces, isFirst: true)
        moveCar(for: &secondTrack, spaces: spaces, isFirst: false)
        validateIfRaceEnd()
    }

    private func validateIfRaceEnd() {
        guard let first = firstTrack.first else { return }
        guard let second = secondTrack.first else { return }
        let firstCar = String(first) == "🚙"
        let secondCar = String(second) == "🚗"
        if firstCar && secondCar {
            winning.message = "It's a tie!"
            winning.isShown = true
        } else if firstCar || secondCar {
            winning.message = firstCar ? "🚙 Won!!!" : "🚗 Won!!!"
            winning.isShown = true
        }
        
    }

    private func moveCar(for track: inout String, spaces: Int, isFirst: Bool) {
        let car = isFirst ? "🚙" : "🚗"
        var array = Array(track).map { String($0) }
        for index in 0..<array.count {
            if array[index] == "💥" {
                array[index] = car
                break
            }
            if array[index] == car {
                let newIndex = index - spaces
                if newIndex <= 0 {
                    // This means the car got to the finish line
                    array[0] = car
                    array[index] = "_"
                    break
                } else {
                    if array[newIndex] == "🌲" {
                        array[newIndex] = "💥"
                        array[index] = "_"
                        break
                    } else {
                        array[index - spaces] = car
                        array[index] = "_"
                        break
                    }
                }
            }
        }
        track = array.joined()
    }

    private func buildTrack(_ track: inout String, with newTrack: String, isFirst: Bool) {
        track.append("🏁")
        track.append(newTrack.shuffled().map { String($0) }.joined())
        track.append(isFirst ? "🚙" : "🚗")
    }
}
