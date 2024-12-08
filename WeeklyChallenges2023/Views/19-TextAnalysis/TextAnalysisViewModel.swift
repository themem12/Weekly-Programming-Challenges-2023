//
//  TextAnalysisViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 23/05/23.
//

import Foundation

class TextAnalysisViewModel: ObservableObject {
    
    @Published var wordCount = 0
    @Published var averageLettersInWords = 0
    @Published var phrasesCount = 0
    @Published var longestWord = ""
    
    @Published var textString: String = "" {
        didSet {
            doAllAnalysis()
        }
    }
    
    private func doAnalysis() {
        wordCount = getWordCount()
        averageLettersInWords = getAverageLettersInWords()
        phrasesCount = getPhrasesCount()
        longestWord = getLongestWord()
    }
    
    private func getWordCount() -> Int {
        return textString.split(separator: " ").count
    }
    
    private func getAverageLettersInWords() -> Int {
        let words = textString.split(separator: " ").compactMap({ "\($0)" })
        guard !words.isEmpty else { return 0 }
        var letters = 0
        for word in words {
            letters += Array(word).count
        }
        
        return letters / words.count
    }
    
    private func getPhrasesCount() -> Int {
        return textString.split(separator: ".").count
    }
    
    private func getLongestWord() -> String {
        let words = textString.split(separator: " ").compactMap({ "\($0)" })
        var longestWord = ""
        for word in words {
            if Array(word).count > Array(longestWord).count {
                longestWord = word
            }
        }
        return longestWord
    }
    
    private func doAllAnalysis() {
        let charsInText = Array(textString).compactMap({ "\($0)" })
        
        var wordsCount = 0
        var phrasesCount = 1
        var longestWord = ""
        var lettersInWordCount = 0
        var currentWord = ""
        
        for char in charsInText {
            switch char {
            case " ":
                currentWord = ""
                break
            case ".":
                phrasesCount += 1
                currentWord = ""
                break
            default:
                if currentWord.count == 0 { wordsCount += 1 }
                currentWord.append(char)
                lettersInWordCount += 1
                longestWord = longestWord.count > currentWord.count ? longestWord : currentWord
                break
            }
        }
        
        let averageLettersInWords = wordsCount == 0 ? 0 : lettersInWordCount / wordsCount
        
        self.wordCount = wordsCount
        self.averageLettersInWords = averageLettersInWords
        self.phrasesCount = phrasesCount
        self.longestWord = longestWord
    }
}
