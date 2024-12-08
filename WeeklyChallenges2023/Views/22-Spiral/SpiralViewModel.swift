//
//  SpiralViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 01/06/23.
//

import Foundation

final class SpiralViewModel: ObservableObject {
    @Published var size: Int? {
        didSet {
            guard let size = size, size != 0 else {
                spiralString = ""
                return
            }
            createSpiral(size)
        }
    }
    
    @Published var spiralString: String = ""
    
    private var spiralMatrix = [[String]]()
    private var spiralSize = 0
    
    private func createSpiral(_ size: Int) {
//        spiralSize = size
//        spiralMatrix = []
//        var newRow = [String]()
//        for _ in 0..<size {
//            newRow.append("*")
//        }
//        for _ in 0..<size {
//            spiralMatrix.append(newRow)
//        }
//
//        spiralMatrix[0][0] = "═"
//
//        moveHorizontal(row: 0, column: 1, isRight: true)
        
        spiralString = createSpiralByRow(size: size)
    }
    //V2
    func createSpiralByRow(size: Int) -> String {
        let top = size % 2 == 0 ? size / 2 : (size + 1) / 2
        var spiralString = ""
        for row in 0..<top {
            if row == 0 {
                spiralString.append(String(repeating: "═", count: size - 1) + "╗\n")
            } else {
                let leftSideString = String(repeating: "║", count: row - 1) + "╔"
                let middleString = String(repeating: "═", count: (size - (2 * row) - 1))
                let rightSideString = "╗" + String(repeating: "║", count: row)
                spiralString.append(leftSideString + middleString + rightSideString + "\n")
            }
        }
        
        for row in top..<size {
            let leftSideString = String(repeating: "║", count: size - row - 1) + "╚"
            let middleString = String(repeating: "═", count: ((2 * row) - size))
            let rightSideString = "╝" + String(repeating: "║", count: size - row - 1)
            spiralString.append(leftSideString + middleString + rightSideString + "\n")
        }
        
        return spiralString
    }
    
    //V1
    private func moveHorizontal(row: Int, column: Int, isRight: Bool) {
        if !shouldContinue() {
            printSpiral()
            return
        }
        //restar en x (columna) hasta topar con algún valor o pared
        let endPoint = isRight ? spiralSize - 1 : 0
        let addValue = isRight ? 1 : -1
        var lastColumn = 0
        for currentColumn in stride(from: column, through: endPoint, by: addValue) {
            lastColumn = currentColumn
            
            let leftValidation = isRight ? currentColumn + 1 : -1
            let rightValidation = isRight ? spiralSize : currentColumn + addValue
            
            if leftValidation < rightValidation, spiralMatrix[row][currentColumn + addValue] != "*" {
                spiralMatrix[row][currentColumn] = isRight ? "╗" : "╚"
                break
            }
            
            if currentColumn == (isRight ? spiralSize - 1 : 0) {
                spiralMatrix[row][currentColumn] = isRight ? "╗" : "╚"
            } else {
                spiralMatrix[row][currentColumn] = "═"
            }
        }
        
        moveVertical(row: row + addValue, column: lastColumn, isUp: !isRight)
    }
    
    private func moveVertical(row: Int, column: Int, isUp: Bool) {
        if !shouldContinue() {
            printSpiral()
            return
        }
        //restar en y (fila) hasta topar con algún valor o pared
        let endPoint = isUp ? 0 : spiralSize - 1
        let addValue = isUp ? -1 : 1
        var lastRow = 0
        for currentRow in stride(from: row, through: endPoint, by: addValue) {
            
            lastRow = currentRow
            
            let leftValidation = isUp ? currentRow - 1 : currentRow + 1
            
            if leftValidation < spiralSize, spiralMatrix[currentRow + addValue][column] != "*" {
                spiralMatrix[currentRow][column] = isUp ? "╔" : "╝"
                break
            }
            
            if currentRow == (isUp ? 0 : spiralSize - 1) {
                spiralMatrix[currentRow][column] = isUp ? "╔" : "╝"
            } else {
                spiralMatrix[currentRow][column] = "║"
            }
        }
        
        moveHorizontal(row: lastRow, column: column - addValue, isRight: isUp)
    }
    
    private func shouldContinue() -> Bool {
        return spiralMatrix.joined().contains("*")
    }

    private func printSpiral() {
        spiralString = ""
        for row in 0..<spiralSize {
            spiralString.append("\(spiralMatrix[row].joined())\n")
        }
    }
}
