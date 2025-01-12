//
//  HauntedHouseViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 19/12/24.
//

import Foundation

final class HauntedHouseViewModel: ObservableObject {
    @Published var map: [[HauntedHouseRoom]] = []
    @Published var movementsButtons: [HauntedHouseRoom.RoomMoves] = []
    @Published var questionString: String = ""
    @Published var answerText: String = ""
    @Published var wrongAnswer: Bool = false
    @Published var didWin: Bool = false

    private var currentRoomPos: (Int, Int) = (0, 0)
    private var currentAnswer: String = ""
    private var currentQuestion: Int = 0
    private let randomizerDelegate: HauntedHouseRandomizerProtocol

    init(delegate: HauntedHouseRandomizerProtocol = LiveHauntedHouseRandomizer()) {
        randomizerDelegate = delegate
        createMap()
    }

    public func reset() {
        didWin = false
        questionString = ""
        answerText = ""
        createMap()
    }
    
    public func createMap() {
        let resultFromDelegate = randomizerDelegate.createMap()
        map = resultFromDelegate.0
        movementsButtons = resultFromDelegate.1
        currentRoomPos = resultFromDelegate.2
        questionString = resultFromDelegate.3
        currentAnswer = resultFromDelegate.4
    }

    public func moveToRoom(_ move: HauntedHouseRoom.RoomMoves) {
        guard checkAnswer() else { return wrongAnswer = true }
        if map[currentRoomPos.0][currentRoomPos.1].type == .ghostRoom {
            guard currentQuestion != 0 else {
                currentQuestion = 1
                return setNewQuestion(map[currentRoomPos.0][currentRoomPos.1])
            }
            currentQuestion = 0
        }
        var newPos: (Int, Int)
        switch move {
        case .north:
            newPos = (currentRoomPos.0 - 1, currentRoomPos.1)
        case .south:
            newPos = (currentRoomPos.0 + 1, currentRoomPos.1)
        case .east:
            newPos = (currentRoomPos.0, currentRoomPos.1 - 1)
        case .west:
            newPos = (currentRoomPos.0, currentRoomPos.1 + 1)
        }
        map[currentRoomPos.0][currentRoomPos.1].occupied = false
        map[newPos.0][newPos.1].occupied = true
        currentRoomPos = newPos
        let currentRoom = map[currentRoomPos.0][currentRoomPos.1]
        guard !checkIfWin(room: currentRoom) else {
            return didWin = true
        }
        movementsButtons = currentRoom.moves
        setNewQuestion(currentRoom)
    }

    private func checkAnswer() -> Bool {
        let isCorrect = answerText.lowercased() == currentAnswer.lowercased()
        answerText = ""
        return isCorrect
    }

    private func setNewQuestion(_ room: HauntedHouseRoom) {
        questionString = room.questions[currentQuestion]
        currentAnswer = room.answers[currentQuestion]
    }

    private func checkIfWin(room: HauntedHouseRoom) -> Bool {
        room.type == .exit
    }
}
