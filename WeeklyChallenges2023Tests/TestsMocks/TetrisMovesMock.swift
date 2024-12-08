//
//  TetrisMovesMock.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 07/12/24.
//

import WeeklyChallenges2023

struct TetrisMovesMock {
    static let initialBoard: [[TetrisCellModel]] = {
        [
            [TetrisCellModel(), TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
        ]
    }()

    static let moveRightBoard: [[TetrisCellModel]] = {
        [
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
        ]
    }()

    static let moveLeftBoard: [[TetrisCellModel]] = {
        [
            [TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
        ]
    }()

    static let moveDownBoard: [[TetrisCellModel]] = {
        [
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
        ]
    }()

    static let moveMiddleBoard: [[TetrisCellModel]] = {
        [
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
        ]
    }()
    static let moveUpFromMiddleBoard: [[TetrisCellModel]] = {
        [
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],

            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
        ]
    }()

    static let moveEndRightBoard: [[TetrisCellModel]] = {
        [
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true)],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
        ]
    }()

    static let moveBottomBoard: [[TetrisCellModel]] = {
        [
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
            
            [TetrisCellModel(), TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],

            [TetrisCellModel(), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(isSelected: true), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel(), TetrisCellModel()],
        ]
    }()
}
