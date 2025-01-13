//
//  Mock.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 12/01/25.
//
import XCTest
@testable import WeeklyChallenges2023

final class MockHauntedHouseRandomizer: HauntedHouseRandomizerProtocol {

    public var initIndex: Int = 0
    public var exitIndex: Int = 1
    public var ghosts: [Int] = []

    func createMap() -> ([[WeeklyChallenges2023.HauntedHouseRoom]], [WeeklyChallenges2023.HauntedHouseRoom.RoomMoves], (Int, Int), String, String) {
        checkValidInit()
        var newMap = [[HauntedHouseRoom]]()
        var moves: [HauntedHouseRoom.RoomMoves] = []
        var currentRoomPos = (0, 0)
        var questionString = ""
        var currentAnswer = ""
        var currentIndex = 0
        
        for column in 0..<4 {
            newMap.append([HauntedHouseRoom]())
            for row in 0..<4 {
                if column == 0 {
                    moves.append(.south)
                }
                if column == 1 || column == 2 {
                    moves.append(.north)
                    moves.append(.south)
                }
                if column == 3 {
                    moves.append(.north)
                }
                switch row {
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
                var room: HauntedHouseRoom
                if currentIndex == initIndex {
                    room = HauntedHouseRoom(type: .entrance, occupied: true)
                    currentRoomPos = (column, row)
                } else if currentIndex == exitIndex {
                    room = HauntedHouseRoom(type: .exit)
                } else if ghosts.contains(currentIndex) {
                    room = HauntedHouseRoom(type: .ghostRoom)
                } else {
                    room = HauntedHouseRoom(type: .normalRoom)
                }
                let question = getQuestion(currentIndex)
                room.questions.append(question.0)
                room.answers.append(question.1)
                if room.occupied {
                    questionString = question.0
                    currentAnswer = question.1
                }
                room.moves = moves
                newMap[column].append(room)
                currentIndex += 1
            }
        }
        return (newMap, moves, currentRoomPos, questionString, currentAnswer)
    }

    private func checkValidInit() {
        guard initIndex != exitIndex else {
            XCTFail("initIndex and exitIndex must be different")
            return
        }
    }

    private func getQuestion(_ index: Int) -> (String, String) {
        return ("\(index)", "\(index)")
    }
}
