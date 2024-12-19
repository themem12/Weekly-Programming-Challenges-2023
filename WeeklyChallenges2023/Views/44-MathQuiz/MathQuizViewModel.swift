//
//  MathQuizViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 18/12/24.
//

import Foundation

struct MathQuizQuestion {
    let question: String
    let answer: Int
}

final class MathQuizViewModel: ObservableObject {
    
    @Published var isQuizStarted: Bool = false
    @Published var answerText: String = ""
    @Published var secondsRemaining: Int = 0
    @Published var question: String = ""
    @Published var points: Int = 0
    
    private var timer: Timer? = nil
    private var currentQuestionNumber: Int = 1 {
        didSet {
            points = currentQuestionNumber - 1
        }
    }
    private var currentQuestion: MathQuizQuestion? {
        didSet {
            guard let currentQuestion = currentQuestion else { return }
            question = currentQuestion.question
        }
    }
    
    func startQuiz() {
        isQuizStarted = true
        restartTimer()
        generateQuestion()
        startTimer()
    }

    func respond() {
        restartTimer()
        let answerText = answerText
        self.answerText = ""
        guard let currentQuestion else { return }
        guard let answer = Int(answerText) else { return }
        guard answer == currentQuestion.answer else {
            isQuizStarted = false
            secondsRemaining = 0
            return
        }
        currentQuestionNumber += 1
        generateQuestion()
        startTimer()
    }

    private func startTimer() {
        secondsRemaining = 3
        var remaining = 3
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            remaining -= 1
            self.secondsRemaining = remaining
            if remaining <= 0 {
                isQuizStarted = false
                restartTimer()
            }
        }
    }

    private func generateQuestion() {
        var x = 0
        var y = 0
        let operation = Int.random(in: 1...4)
        if currentQuestionNumber < 6 {
            x = Int.random(in: 0...9)
            y = Int.random(in: 0...9)
        } else if currentQuestionNumber < 11 {
            x = Int.random(in: 0...99)
            y = Int.random(in: 0...9)
        } else if currentQuestionNumber < 16 {
            x = Int.random(in: 0...99)
            y = Int.random(in: 0...99)
        } else {
            x = Int.random(in: 0...999)
            y = Int.random(in: 0...99)
        }

        switch operation {
            case 1:
            currentQuestion = MathQuizQuestion(question: "\(x)+\(y)", answer: x + y)
        case 2:
            if x > y {
                currentQuestion = MathQuizQuestion(question: "\(x)-\(y)", answer: x - y)
            } else {
                currentQuestion = MathQuizQuestion(question: "\(y)-\(x)", answer: y - x)
            }
        case 3:
            currentQuestion = MathQuizQuestion(question: "\(x)*\(y)", answer: x * y)
        case 4:
            if y == 0 {
                generateQuestion()
                break
            }
            currentQuestion = MathQuizQuestion(question: "\(x)/\(y)", answer: x / y)
        default:
            break
        }
    }

    private func restartTimer() {
        timer?.invalidate()
        timer = nil
    }
}
