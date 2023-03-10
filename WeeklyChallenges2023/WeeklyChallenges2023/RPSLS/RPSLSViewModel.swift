//
//  RPSLSViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 07/03/23.
//

import Foundation

class RPSLSViewModel: ObservableObject {
    
    let options = [
        Item(name: RPSLSOptions.rockString, winTo: [RPSLSOptions.scissorsString, RPSLSOptions.lizardString]),
        Item(name: RPSLSOptions.paperString, winTo: [RPSLSOptions.rockString, RPSLSOptions.spockString]),
        Item(name: RPSLSOptions.scissorsString, winTo: [RPSLSOptions.paperString, RPSLSOptions.lizardString]),
        Item(name: RPSLSOptions.lizardString, winTo: [RPSLSOptions.spockString, RPSLSOptions.paperString]),
        Item(name: RPSLSOptions.spockString, winTo: [RPSLSOptions.scissorsString, RPSLSOptions.rockString]),
    ]
    
    var playerOne: Item? {
        didSet {
            if playerOne == nil { return }
            playerString = "Jugador 2"
            if !twoPlayersActive {
                playerTwo = options[Int.random(in: 0..<options.count)]
            }
        }
    }
    
    var playerTwo: Item? {
        didSet {
            if playerTwo == nil { return }
            validateWinner()
        }
    }
    
    @Published var twoPlayersActive = false
    @Published var gameString = "_"
    @Published var playerString = "Jugador 1"
    
    struct Item: Equatable {
        let name: RPSLSOptions
        let winTo: [RPSLSOptions]
    }


    func validateWinner() {
        if playerOne == playerTwo {
            gameString = "Es un empate"
        } else {
            if playerOne?.winTo.contains(playerTwo?.name ?? .none) ?? false {
                gameString = "Jugador uno gana!!! \(playerOne?.name.rawValue ?? "")"
            } else {
                gameString = "Jugador dos gana!!! \(playerTwo?.name.rawValue ?? "")"
            }
        }
        
        resetGame()
    }
    
    private func resetGame() {
        playerOne = nil
        playerTwo = nil
        playerString = "Jugador 1"
    }
}

enum RPSLSOptions: String {
    case rockString = "🗿"
    case paperString = "📄"
    case scissorsString = "✂️"
    case lizardString = "🦎"
    case spockString = "🖖🏽"
    case none = ""
}
