//
//  HauntedHouseViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 19/12/24.
//

import Foundation

struct HauntedHouseRoom: Identifiable, Equatable {
    enum RoomType {
        case entrance
        case exit
        case normalRoom
        case ghostRoom
    }

    enum RoomMoves {
        case north
        case south
        case east
        case west
    }
    
    let id = UUID()
    let type: RoomType
    var occupied: Bool = false
    var moves: [RoomMoves] = []
    var question: String = ""
    var answer: String = ""
}

final class HauntedHouseViewModel: ObservableObject {
    @Published var map: [[HauntedHouseRoom]] = []
    @Published var movementsButtons: [HauntedHouseRoom.RoomMoves] = []
    @Published var questionString: String = ""
    @Published var answerText: String = ""
    @Published var wrongAnswer: Bool = false
    @Published var didWin: Bool = false

    private var currentRoomPos: (Int, Int) = (0, 0)
    private var currentAnswer: String = ""

    init() {
        createMap()
    }

    public func reset() {
        didWin = false
        questionString = ""
        answerText = ""
        createMap()
    }
    
    public func createMap() {
        var rooms = [
            HauntedHouseRoom(type: .entrance, occupied: true),
            HauntedHouseRoom(type: .exit)
        ]

        for _ in 0..<14 {
            rooms.append(HauntedHouseRoom(type: getRoomType()))
        }
        rooms.shuffle()
        var newMap = [[HauntedHouseRoom]]()
        var index = 0
        for i in 0..<4 {
            newMap.append([])
            for j in 0..<4 {
                var moves: [HauntedHouseRoom.RoomMoves] = []
                if i == 0 {
                    moves.append(.south)
                }
                if i == 1 || i == 2 {
                    moves.append(.north)
                    moves.append(.south)
                }
                if i == 3 {
                    moves.append(.north)
                }
                switch j {
                case 0:
                    moves.append(.west)
                case 1, 2:
                    moves.append(.east)
                    moves.append(.west)
                case 3:
                    moves.append(.east)
                default:
                    break
                }
                var room = rooms[index]
                room.moves = moves
                let question = getQuestion(for: index)
                room.question = question.0
                room.answer = question.1
                newMap[i].append(room)
                if room.occupied {
                    movementsButtons = room.moves
                    currentRoomPos = (i, j)
                    questionString = question.0
                    currentAnswer = question.1
                }
                index += 1
            }
        }
        self.map = newMap
    }

    public func moveToRoom(_ move: HauntedHouseRoom.RoomMoves) {
        guard checkAnswer() else { return wrongAnswer = true }
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
        answerText.lowercased() == currentAnswer.lowercased()
    }

    private func getRoomType() -> HauntedHouseRoom.RoomType {
        let randomNumber = Int.random(in: 0..<100)
        return randomNumber < 10 ? .ghostRoom : .normalRoom
    }

    private func setNewQuestion(_ room: HauntedHouseRoom) {
        questionString = room.question
        currentAnswer = room.answer
    }

    private func checkIfWin(room: HauntedHouseRoom) -> Bool {
        room.type == .exit
    }
}

extension HauntedHouseViewModel {
    private func getQuestion(for index: Int) -> (String, String) {
        return ("Who?", "Me")
    }
}
