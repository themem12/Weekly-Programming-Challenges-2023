//
//  TetrisViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 05/12/24.
//

import Foundation

public struct TetrisCellModel: Hashable {
    var id = UUID()
    var isSelected: Bool = false

    public init(isSelected: Bool = false) {
        self.isSelected = isSelected
    }
}

extension TetrisCellModel: Equatable {
    public static func == (lhs: TetrisCellModel, rhs: TetrisCellModel) -> Bool {
        lhs.isSelected == rhs.isSelected
    }
}

final class TetrisViewModel: ObservableObject {
    @Published var board: [[TetrisCellModel]] = {
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

    init() {}

    public func moveLeft() {
        for row in board {
            if let firstInRow = row.first, firstInRow.isSelected { return print("No more left") }
        }
        for rowIndex in 0..<board.count {
            for index in 0..<board[rowIndex].count - 1 {
                if board[rowIndex][index + 1].isSelected {
                    board[rowIndex][index + 1].isSelected = false
                    board[rowIndex][index].isSelected = true
                }
            }
        }
    }

    public func moveUP() {
        guard let firstRow = board.first else { return }
        for cell in firstRow {
            if cell.isSelected {
                return print("No more up")
            }
        }

        for rowIndex in 0..<board.count {
            let row = board[rowIndex]
            let rowCount = row.count - 1
            for index in 0...rowCount {
                if board[rowIndex][index].isSelected {
                    board[rowIndex][index].isSelected = false
                    board[rowIndex - 1][index].isSelected = true
                }
            }
        }
    }

    public func moveDown() {
        guard let lastRow = board.last else { return }
        for cell in lastRow {
            if cell.isSelected {
                return print("No more down")
            }
        }
        let totalRows = board.count - 1
        for rowIndex in 0...totalRows {
            let row = board[rowIndex]
            let rowCount = row.count - 1
            for index in 0...rowCount {
                if board[totalRows - rowIndex][index].isSelected {
                    board[totalRows - rowIndex][index].isSelected = false
                    board[totalRows - rowIndex + 1][index].isSelected = true
                }
            }
        }
    }

    public func moveRight() {
        for row in board {
            if let firstInRow = row.last, firstInRow.isSelected { return print("No more right") }
        }

        for rowIndex in 0..<board.count {
            let row = board[rowIndex]
            let rowCount = row.count - 1
            for index in 0...rowCount {
                let cellIndex = rowCount - index
                if board[rowIndex][cellIndex].isSelected {
                    board[rowIndex][cellIndex].isSelected = false
                    board[rowIndex][(cellIndex + 1)].isSelected = true
                }
            }
        }
    }

    public func rotate() {
        transpose()
        for rowIndex in 0..<board.count {
            board[rowIndex].reverse()
        }
    }

    private func transpose() {
        guard let firstRow = board.first else { return }
        board = firstRow.indices.map { index in
            board.map { $0[index] }
        }
    }
}
