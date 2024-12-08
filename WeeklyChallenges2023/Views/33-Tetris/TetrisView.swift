//
//  TetrisView.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 03/12/24.
//

import SwiftUI

struct TetrisView: View {

    @StateObject var viewModel = TetrisViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.board, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { cell in
                        Rectangle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(cell.isSelected ? .red : .blue)
                    }
                }
            }
            HStack {
                Spacer()
                TetrisButton(move: .left) {
                    viewModel.moveLeft()
                }
                VStack {
                    TetrisButton(move: .up) {
                        viewModel.moveUP()
                    }
                    TetrisButton(move: .down) {
                        viewModel.moveDown()
                    }
                }
                TetrisButton(move: .right) {
                    viewModel.moveRight()
                }
                Spacer()
                TetrisButton(move: .rotate) {
                    viewModel.rotate()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    TetrisView()
}

struct TetrisButton: View {
    enum TetrisMove: String {
        case up = "chevron.up"
        case down = "chevron.down"
        case left = "chevron.left"
        case right = "chevron.right"
        case rotate = "rotate.right"
    }
    
    let move: TetrisMove
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
            print(move.rawValue)
        } label: {
            Image(systemName: "\(move.rawValue)")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(Color.white)
        }
        .frame(width: 50, height: 50)
        .background(Color.red)
        .cornerRadius(10)
    }
}
