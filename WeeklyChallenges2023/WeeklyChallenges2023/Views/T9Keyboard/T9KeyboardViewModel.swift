//
//  T9KeyboardViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 02/11/24.
//

import Foundation

class T9KeyboardViewModel: ObservableObject {
    enum T9Key: String {
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
    }
    
    private var keysPressed: [T9Key] = [] {
        didSet {
            text = keysPressed.map { $0.rawValue }.joined()
        }
    }
    private var timer: Timer?
    private var repeatedKey = 0
    
    @Published var text: String = ""
    
    public func keyPressed(_ key: T9Key) {
        keysPressed.append(key)
        if keysPressed.last != key {
            repeatedKey = 0
            keysPressed.append(.slash)
        } else {
            repeatedKey += 1
            if repeatedKey >= 3 {
                repeatedKey = 0
                keysPressed.append(.slash)
            }
        }
        // if timer still running add new key and restart timer
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(addSlash), userInfo: nil, repeats: false)
    }
    
    @objc func addSlash(timer: Timer) {
        if keysPressed.last != .slash {
            keysPressed.append(.slash)
        }
    }
}
