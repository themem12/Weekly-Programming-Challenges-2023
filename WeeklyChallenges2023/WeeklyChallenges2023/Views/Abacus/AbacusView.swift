//
//  AbacusView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 21/11/24.
//

import SwiftUI

struct AbacusView: View {
    
    @StateObject var viewModel = AbacusViewModel()
    
    var body: some View {
        VStack(spacing: .zero) {
            Rectangle()
                .fill(Color.brown)
                .frame(height: 20)
                .padding(.horizontal)
            ForEach(viewModel.abacus, id: \.self) { abacusCount in
                HStack(spacing: .zero) {
                    Rectangle()
                        .fill(Color.brown)
                        .frame(width: 20, height: 40)
                    ForEach(0...9, id: \.self) { index in
                        let center = 9 - abacusCount.count
                        AbacusButton(
                            status: index < center ? .left : index == center ? .center : .right
                        ) {
                            viewModel.move(
                                abacusCount.unit,
                                add: index < center
                            )
                        }
                    }
                    Rectangle()
                        .fill(Color.brown)
                        .frame(width: 20, height: 40)
                }
            }
            Rectangle()
                .fill(Color.brown)
                .frame(height: 20)
                .padding(.horizontal)
            Text(viewModel.number)
                .font(.title)
                .bold()
                .foregroundStyle(.gray)
        }
    }
}

fileprivate struct AbacusButton: View {
    enum Status {
        case left
        case right
        case center
    }
    let status: Status
    let action: () -> Void
    var body: some View {
        switch status {
        case .left:
            Button {
                action()
            } label: {
                AbacusCountView(color: .green)
            }
        case .right:
            Button {
                action()
            } label: {
                AbacusCountView(color: .red)
            }
        case .center:
            Rectangle()
                .fill(Color.gray)
                .frame(width: 30, height: 8)
        }
    }
}

fileprivate struct AbacusCountView: View {
    let color: Color
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 30, height: 8)
            Circle()
                .fill(color)
                .frame(width: 30, height: 30)
        }
    }
}

#Preview {
    AbacusView()
}
