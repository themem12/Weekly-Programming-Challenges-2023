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
        VStack {
            ForEach(viewModel.abacus, id: \.self) { abacusCount in
                HStack {
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
                }
            }
            Text(viewModel.number)
                .font(.title)
                .bold()
                .foregroundStyle(.white)
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
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 30, height: 30)
            }
        case .right:
            Button {
                action()
            } label: {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 30, height: 30)
            }
        case .center:
            Rectangle()
                .fill(Color.white)
                .frame(width: 30, height: 30)
        }
    }
}

#Preview {
    AbacusView()
}
