//
//  LiveHauntedHouseRandomizer.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 12/01/25.
//

final class LiveHauntedHouseRandomizer: HauntedHouseRandomizerProtocol {
    func createMap() -> ([[HauntedHouseRoom]], [HauntedHouseRoom.RoomMoves], (Int, Int), String, String) {
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
        var movementsButtons: [HauntedHouseRoom.RoomMoves] = []
        var currentRoomPos = (0, 0)
        var questionString = ""
        var currentAnswer = ""
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
                let numberOfQuestions = room.type == .ghostRoom ? 2 : 1
                for _ in 0..<numberOfQuestions {
                    let question = getQuestion()
                    room.questions.append(question.0)
                    room.answers.append(question.1)
                }
                newMap[i].append(room)
                if room.occupied {
                    movementsButtons = room.moves
                    currentRoomPos = (i, j)
                    questionString = room.questions.first ?? ""
                    currentAnswer = room.answers.first ?? ""
                }
                index += 1
            }
        }
        return (newMap, movementsButtons, currentRoomPos, questionString, currentAnswer)
    }
    
    private func getQuestion() -> (String, String) {
        let firstNumber = Int.random(in: 0..<100)
        let secondNumber = Int.random(in: 0..<100)
        let question = "\(firstNumber) + \(secondNumber)"
        let answer = String(firstNumber + secondNumber)
        return (question, answer)
    }

    private func getRoomType() -> HauntedHouseRoom.RoomType {
        let randomNumber = Int.random(in: 0..<100)
        return randomNumber < 10 ? .ghostRoom : .normalRoom
    }
}
