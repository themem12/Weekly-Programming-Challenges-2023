//
//  TetrisView.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 03/12/24.
//

import SwiftUI

struct TetrisView: View {
    var body: some View {
        VStack {
            ForEach(0..<10, id: \.self) { _ in
                HStack {
                    ForEach(0..<10, id: \.self) { _ in
                        Rectangle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.red)
                    }
                }
            }
            HStack {
                TetrisButton(move: .left) {
                    
                }
                VStack {
                    TetrisButton(move: .up) {
                        
                    }
                    TetrisButton(move: .down) {
                        
                    }
                }
                TetrisButton(move: .right) {
                    
                }
            }
        }
    }
}

#Preview {
    TetrisView()
}

struct TetrisButton: View {
    enum TetrisMove: String {
        case up = "up"
        case down = "down"
        case left = "left"
        case right = "right"
    }
    
    let move: TetrisMove
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
            print(move.rawValue)
        } label: {
            Image(systemName: "chevron.\(move.rawValue)")
                .font(.largeTitle)
                .bold()
        }
        .frame(width: 40, height: 40)
        .background(Color.red)
    }
}
