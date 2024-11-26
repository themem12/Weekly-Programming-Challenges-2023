//
//  KonamiCodeView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 06/10/24.
//

import SwiftUI

struct KonamiCodeView: View {
    @StateObject var viewModel = KonamiCodeViewModel()
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                NESControllerCross(viewModel: viewModel)
                Spacer()
                NESControllerButton(type: .select, viewModel: viewModel)
                NESControllerButton(type: .start, viewModel: viewModel)
                Spacer()
                NESControllerButton(type: .b, viewModel: viewModel)
                NESControllerButton(type: .a, viewModel: viewModel)
                Spacer()
            }
            .padding()
            .alert("Konami Code inserted", isPresented: $viewModel.didEnteredCorrectly) {
                Button("Reset code", role: .cancel) {
                    viewModel.resetCode()
                }
            }
        }
    }
}

fileprivate struct NESControllerCross: View {
    let viewModel: KonamiCodeViewModel
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                NESControllerSpace()
                NESControllerButton(type: .up, viewModel: viewModel)
                NESControllerSpace()
            }
            HStack(spacing: .zero) {
                NESControllerButton(type: .left, viewModel: viewModel)
                NESControllerSpace(isCenter: true)
                NESControllerButton(type: .right, viewModel: viewModel)
            }
            HStack(spacing: .zero) {
                NESControllerSpace()
                NESControllerButton(type: .down, viewModel: viewModel)
                NESControllerSpace()
            }
        }
        .padding(.bottom, 25)
    }
}

fileprivate struct NESControllerButton: View {
    let type: ControllerButtonType
    let viewModel: KonamiCodeViewModel
    var body: some View {
        Button {
            viewModel.buttonTapped(type)
        } label: {
            switch type {
            case .up, .down, .left, .right:
                ArrowButton(type: type)
            case .select, .start:
                PillButton(type: type)
            case .a, .b:
                CircleButton(type: type)
            }
        }

    }
}

fileprivate struct ArrowButton: View {
    let type: ControllerButtonType
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 30, height: 30)
                .foregroundColor(.init(uiColor: .darkGray))
            Image(systemName: "chevron.\(type.rawValue)")
                .foregroundColor(.gray)
        }
    }
}

fileprivate struct PillButton: View {
    let type: ControllerButtonType
    var body: some View {
        VStack {
            Text("\(type.rawValue.uppercased())")
                .bold()
                .font(.system(size: 12))
                .foregroundColor(.red)
            Rectangle()
                .cornerRadius(10)
                .frame(width: 50, height: 20)
                .foregroundColor(.gray)
        }
        .padding(.bottom, 25)
    }
}

fileprivate struct CircleButton: View {
    let type: ControllerButtonType
    var body: some View {
        VStack(alignment: .trailing, spacing: .zero) {
            ZStack {
                Rectangle()
                    .frame(width: 45, height: 45)
                    .foregroundColor(Color.init(uiColor: .lightGray))
                    .cornerRadius(3)
                Circle()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.red)
            }
            Text(type.rawValue.uppercased())
                .foregroundColor(.red)
                .font(.system(size: 14))
                .bold()
        }
    }
}

fileprivate struct NESControllerSpace: View {
    var isCenter: Bool = false
    var body: some View {
        Rectangle()
            .frame(width: 30, height: 30)
            .foregroundColor(isCenter ? .init(uiColor: .darkGray) : .clear)
    }
}

struct KonamiCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Image("Nes_Controller", bundle: .main)
                .resizable()
                .aspectRatio(contentMode: .fit)
            KonamiCodeView()
                .background(Color.black)
        }
    }
}
