//
//  WordGuessViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 12/04/23.
//

import Foundation

class WordGuessViewModel: ObservableObject {
    @Published var guessWordString = ""
    @Published var letterGuessField = "" {
        didSet {
            if letterGuessField != "" {
                tryLetter(letterGuessField.lowercased())
                letterGuessField = ""
            }
        }
    }
    @Published var wordGuessField = ""
    
    @Published var livesString = "3"
    private var lives = 3 {
        didSet {
            livesString = "\(lives)"
            if lives == 0 {
                loseGame = true
            }
        }
    }
    @Published var winGame = false
    @Published var loseGame = false
    
    private var wordToGuess = ""
    
    init() {
        getNewWord()
    }
    
    private func getNewWord() {
        wordToGuess = wordList[Int.random(in: 0..<100)]
        guessWordString = wordToGuess
        let letters = Array(Set(Array(wordToGuess)))
        let percentage = Int.random(in: 0...5) * 10
        
        let numberOfLettersToDelete = letters.count * percentage / 100
        
        for _ in 0...numberOfLettersToDelete {
            guessWordString = guessWordString.replacingOccurrences(of: "\(letters[Int.random(in: 0..<letters.count)])", with: "-")
        }
    }
    
    func tryLetter(_ letter: String) {
        print("guessLetter: ", letter)
        if wordToGuess.lowercased().contains(letter) {
            let wordArray = Array(wordToGuess)
            var guessArray = Array(guessWordString)
            
            for index in 0..<wordArray.count {
                print("wordArray: ", String(wordArray[index]))
                if String(wordArray[index]).lowercased() == letter {
                    guessArray[index] = wordArray[index]
                }
            }
            guessWordString = String(guessArray)
            if !guessWordString.contains("-") {
                winGame = true
            }
        } else {
            lives -= 1
        }
    }
    
    public func guessWord() {
        if wordGuessField != "" {
            if wordGuessField.lowercased() == wordToGuess.lowercased() {
                winGame = true
            } else {
                lives -= 1
            }
            wordGuessField = ""
        }
    }
    
    public func resetGame() {
        winGame = false
        loseGame = false
        lives = 3
        getNewWord()
    }
}
