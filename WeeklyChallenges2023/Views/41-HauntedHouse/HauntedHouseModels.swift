//
//  HauntedHouseModels.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 12/01/25.
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
    var questions: [String] = []
    var answers: [String] = []
}

protocol HauntedHouseRandomizerProtocol {
    func createMap() -> ([[HauntedHouseRoom]], [HauntedHouseRoom.RoomMoves], (Int, Int), String, String)
}
