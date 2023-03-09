//
//  PasswordGeneratorViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 06/03/23.
//

import SwiftUI


class PasswordGeneratorViewModel: ObservableObject {
    @Published var passwordField: String = ""
    public var passwordLength: Int = 8 {
        didSet {
            createNewPassword()
        }
    }
    
    public var withCapital: Bool = false {
        didSet {
            createNewPassword()
        }
    }
    
    public var withNumbers: Bool = false {
        didSet {
            createNewPassword()
        }
    }
    
    public var withSpecial: Bool = false {
        didSet {
            createNewPassword()
        }
    }
    private var possibleChars: [Int] = Array(97...122)
    
    init() {
        createNewPassword()
    }
    
    public func createNewPassword() {
        possibleChars = Array(97...122)
        if withNumbers {
            possibleChars.append(contentsOf: Array(48...57))
        }

        if withCapital {
            possibleChars.append(contentsOf: Array(65...90))
        }

        if withSpecial {
            possibleChars.append(contentsOf: Array(33...47))
            possibleChars.append(contentsOf: Array(58...64))
            possibleChars.append(contentsOf: Array(91...96))
        }
        
        passwordField = getPassword()
    }
    
    func getPassword(actualLenght: Int = 0, password: String = "") -> String {
        if actualLenght < passwordLength {
            let utfChar = possibleChars[Int.random(in: 0..<possibleChars.count)]
            let char = Character(UnicodeScalar(utfChar)!)
            return getPassword(actualLenght: actualLenght + 1,password: "\(password)\(char)")
        } else {
            return password
        }
    }
    
}
