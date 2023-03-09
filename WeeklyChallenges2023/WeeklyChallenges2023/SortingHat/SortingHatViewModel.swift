//
//  SortingHatViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 09/03/23.
//

import Foundation

class SortingHatViewModel: ObservableObject {
    @Published var questionIndex = 0
    @Published var questionString = "Dawn or dusk?"
    @Published var responseOne = "dawn"
    @Published var responseTwo = "dusk"
    @Published var houseSelected = ""
    @Published var showHouse = false
    
    let questions: [String] = [
        "Dawn or dusk?",
        "Forest or river?",
        "Moon or stars?",
        "Black or White?",
        "Heads or Tails?",
        "Left or Right?"
    ]
    
    let answers: [[String]] = [
        ["dawn", "dusk"],
        ["forest", "river"],
        ["moon", "stars"],
        ["black", "white"],
        ["heads", "tails"],
        ["left", "right"],
    ]
    
    let questionsAnswers: [String: [String: [Int]]] = [
        "Dawn or dusk?": [
            "dawn"  : [73, 73, 30, 26],
            "dusk"  : [27, 27, 70, 74]
        ],
        "Forest or river?": [
            "forest": [74, 73, 26, 28],
            "river" : [26, 27, 74, 72],
        ],
        "Moon or stars?": [
            "moon"  : [27, 74, 33, 72],
            "stars" : [73, 26, 67, 28],
        ],
        "Black or White?": [
            "black" : [73, 29, 24, 72],
            "white" : [27, 71, 76, 28],
        ],
        "Heads or Tails?": [
            "heads" : [27, 69, 74, 27],
            "tails" : [73, 31, 26, 73],
        ],
        "Left or Right?": [
            "left"  : [29, 70, 29, 73],
            "right" : [71, 30, 71, 27],
        ],
    ]
    
    private var grifindor = 0
    private var ravenclaw = 0
    private var hufflepuff = 0
    private var slytherin = 0

    func validationResponse(_ response: String) {
        
        guard let value = questionsAnswers[questionString]?[response] else { return }
        
        grifindor  += value[0]
        ravenclaw  += value[1]
        hufflepuff += value[2]
        slytherin  += value[3]
        
        questionIndex += 1
        
        if questionIndex < questions.count {
            questionString = questions[questionIndex]
        } else {
            validateHouse()
        }
    }
    
    private func validateHouse() {
        let topValue = [grifindor, ravenclaw, hufflepuff, slytherin].sorted(by: { $0 > $1 }).first ?? -1

        if topValue == grifindor { houseSelected = "Grifindor!!!" }
        else if topValue == ravenclaw { houseSelected = "Ravenclaw!!!" }
        else if topValue == hufflepuff { houseSelected = "Hufflepuff!!!" }
        else if topValue == slytherin { houseSelected = "Slytherin!!!" }
        
        showHouse = true
    }
    
    func getAsnwerOneString() -> String {
        if questionIndex == questions.count { return "" }
        return answers[questionIndex][0]
    }
    
    func getAsnwerTwoString() -> String {
        if questionIndex == questions.count { return "" }
        return answers[questionIndex][1]
    }
}
