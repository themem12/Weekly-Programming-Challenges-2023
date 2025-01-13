//
//  HauntedHouseView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 20/12/24.
//

import SwiftUI

struct HauntedHouseView: View {

    @ObservedObject var viewModel = HauntedHouseViewModel()

    var body: some View {
        VStack {
            ForEach(viewModel.map.indices, id: \.self) { rowIndex in
                let row = viewModel.map[rowIndex]
                HStack {
                    ForEach(row) { room in
                        HauntedHouseRoomView(roomInfo: room)
                    }
                }
            }
            Text("Question: \(viewModel.questionString)")
            TextField(text: $viewModel.answerText) {
                Text("Answer right so you can move")
            }
            .textFieldStyle(OvalTextFieldStyle())
            .keyboardType(.decimalPad)
            HauntedHouseButtonsView(moves: viewModel.movementsButtons, action: viewModel.moveToRoom(_:))
        }.alert("Wrong answer", isPresented: $viewModel.wrongAnswer, actions: {
            Button {
                viewModel.wrongAnswer = false
            } label: {
                Text("Ok")
            }
        }, message: {
            Text("Try again")
                .font(.title)
        })
        .alert("You won!", isPresented: $viewModel.didWin, actions: {
            Button {
                viewModel.reset()
            } label: {
                Text("Ok")
            }
        }, message: {
            Text("Congratulations!")
                .font(.title)
        })
    }
}

private struct HauntedHouseRoomView: View {

    let roomInfo: HauntedHouseRoom
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.green)
            Text(roomInfo.type == .entrance ? "🚪" : roomInfo.type == .exit ? "🍭" : roomInfo.type == .ghostRoom ? "👻" : "⬜️")
            if roomInfo.occupied {
                Circle()
                    .fill(Color.red)
                    .frame(width: 10, height: 10)
            }
        }.frame(width: 50, height: 50)
    }
}

private struct HauntedHouseButtonsView: View {

    let moves: [HauntedHouseRoom.RoomMoves]
    let action: (HauntedHouseRoom.RoomMoves) -> Void

    var body: some View {
        VStack(spacing: .zero) {
            HStack {
                Spacer()
                HauntedHouseButtonView(isActive: moves.contains(.north), buttonType: .north, action: action)
                Spacer()
            }
            HStack(spacing: .zero) {
                HauntedHouseButtonView(isActive: moves.contains(.east), buttonType: .east, action: action)
                HauntedHouseButtonView(isActive: moves.contains(.south), buttonType: .south, action: action)
                HauntedHouseButtonView(isActive: moves.contains(.west), buttonType: .west, action: action)
            }
        }
    }
}

private struct HauntedHouseButtonView: View {

    let isActive: Bool
    let buttonType: HauntedHouseRoom.RoomMoves
    let action: (HauntedHouseRoom.RoomMoves) -> Void

    var body: some View {
        let buttonString: String = buttonType == .east ? "left" : buttonType == .west ? "right" : buttonType == .north ? "up" : "down"
        Button {
            action(buttonType)
        } label: {
            ZStack {
                Rectangle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue.opacity(isActive ? 1 : 0.5))
                Image(systemName: "chevron.\(buttonString)")
                    .foregroundColor(isActive ? .white : .gray)
                    .font(.title)
                    .bold()
            }
        }
        .frame(width: 60, height: 60)
        .disabled(!isActive)
    }
}

#Preview {
    HauntedHouseView()
}
