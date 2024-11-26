//
//  TennisGameViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 09/03/23.
//

import Foundation

class TennisGameViewModel: ObservableObject {
    @Published var playerOnePoints = Scores.love
    @Published var playerTwoPoints = Scores.love
    @Published var gamesStories: [Game] = []
    @Published var gameNumber = 1
    @Published var winner: String?
    @Published var finishedGame = false
    
    func playerOneAddPoint() {
        playerOnePoints = playerOnePoints.getNext()
        validateWinner()
    }
    
    func playerTwoAddPoint() {
        playerTwoPoints = playerTwoPoints.getNext()
        validateWinner()
    }
    
    func resetGame() {
        playerOnePoints = .love
        playerTwoPoints = .love
        winner = nil
        finishedGame = false
    }
    
    private func validateWinner() {
        if playerOnePoints == .win || playerTwoPoints == .win {
            gamesStories.append(Game(player1Score: playerOnePoints, player2Score: playerTwoPoints, id: gameNumber))
            winner = playerOnePoints == .win ? "Ganó jugador 1" : "Ganó jugador 2"
            finishedGame = true
            gameNumber += 1
        }
    }
}

enum Scores {
    case love
    case first
    case second
    case third
    case deuce
    case advantage
    case win
    
    func getNext() -> Scores {
        switch self {
        case .love:
            return .first
        case .first:
            return .second
        case .second:
            return .third
        case .third:
            return .deuce
        case .deuce:
            return .advantage
        case .advantage:
            return .win
        case .win:
            return .love
        }
    }
    
    func getText() -> String {
        switch self {
        case .love:
            return "Love"
        case .first:
            return "15"
        case .second:
            return "30"
        case .third:
            return "40"
        case .deuce:
            return "Deuce"
        case .advantage:
            return "Ventaja"
        case .win:
            return "Ganó"
        }
    }
}

struct Game: Identifiable {
    let player1Score: Scores
    let player2Score: Scores
    let id: Int
}
