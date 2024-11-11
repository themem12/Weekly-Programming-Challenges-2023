//
//  T9KeyboardViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 02/11/24.
//

import Foundation

fileprivate var T9KeyboardDictionary: [T9KeyboardViewModel.T9Key: [String]] = [
    .two: ["a", "b", "c"],
    .three: ["d", "e", "f"],
    .four: ["g", "h", "i"],
    .five: ["j", "k", "l"],
    .six: ["m", "n", "o"],
    .seven: ["p", "q", "r", "s"],
    .eight: ["t", "u", "v"],
    .nine: ["w", "x", "y", "z"],
    .zero: [" "],
    .one: ["^_^"],
    .slash: [""],
    .hashtag: ["#"],
    .asterisk: ["*"]
]

class T9KeyboardViewModel: ObservableObject {
    enum T9Key: String {
        case zero = "0"
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case slash = "-"
        case hashtag = "#"
        case asterisk = "*"
    }
    
    private var keysPressed: [T9Key] = [] {
        didSet {
            uncodedText = keysPressed.map { $0.rawValue }.joined()
        }
    }
    private var timer: Timer?
    private var repeatedKey = 0
    
    @Published var uncodedText: String = ""
    @Published var decodedText: String = ""

    public func reset() {
        keysPressed.removeAll()
        uncodedText = ""
        decodedText = ""
    }
    
    public func keyPressed(_ key: T9Key) {
        guard key != .asterisk, key != .hashtag, key != .zero, key != .one else {
            return specialKeyPressed(key)
        }
        if keysPressed.last != key {
            repeatedKey = 0
            addSlash()
        } else {
            repeatedKey += 1
            if repeatedKey >= threeOrFourOptions(key) {
                repeatedKey = 0
                addSlash()
            }
        }
        keysPressed.append(key)
        // if timer still running add new key and restart timer
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(appendSlashIfNeeded), userInfo: nil, repeats: false)
    }

    private func specialKeyPressed(_ key: T9Key) {
        addSlash()
        keysPressed.append(key)
        addSlash()
    }

    private func threeOrFourOptions(_ key: T9Key) -> Int {
        switch key {
        case .two, .three, .four, .five, .six, .eight:
            return 3
        case .seven, .nine:
            return 4
        default :
            return 0
        }
    }

    private func mapToText() {
        var text = ""
        var lastKey: (T9Key, Int) = (T9Key.slash, 0)
        for key in keysPressed {
            if key == .slash {
                if lastKey.0 != .slash {
                    text.append("\(T9KeyboardDictionary[lastKey.0]![lastKey.1 - 1])")
                    lastKey = (.slash, 0)
                }
            } else {
                lastKey.0 = key
                lastKey.1 += 1
            }
        }
        decodedText = text
    }

    private func addSlash() {
        if let key = keysPressed.last, key != .slash {
            keysPressed.append(.slash)
        }
        mapToText()
    }
    
    @objc private func appendSlashIfNeeded(timer: Timer) {
        addSlash()
    }
}
