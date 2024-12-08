//
//  PassWordGeneratorView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 06/03/23.
//

import SwiftUI

struct PassWordGeneratorView: View {
    @StateObject private var modelView = PasswordGeneratorViewModel()
    var body: some View {
        VStack {
            Spacer()
            ZStack(alignment: .trailing) {
                TextField("Contraseña", text: $modelView.passwordField)
                    .padding(.trailing, 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    UIPasteboard.general.string = modelView.passwordField
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                }

            }.padding(10)
            HStack {
                VStack {
                    Button("Mayúsculas") {
                        modelView.withCapital.toggle()
                    }
                    .frame(width: 200, height: 50)
                    .background(modelView.withCapital ? Color(UIColor.systemIndigo) : Color(UIColor.gray))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    Spacer()
                    Button("Caracteres especiales") {
                        modelView.withSpecial.toggle()
                    }
                    .frame(width: 200, height: 50)
                    .background(modelView.withSpecial ? Color(UIColor.systemIndigo) : Color(UIColor.gray))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }.frame(height: 100)
                VStack {
                    Button("Números") {
                        modelView.withNumbers.toggle()
                    }
                    .frame(width: 200, height: 50)
                    .background(modelView.withNumbers ? Color(UIColor.systemIndigo) : Color(UIColor.gray))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    Spacer()
                    HStack {
                        Spacer()
                        Button("-") {
                            if modelView.passwordLength > 0 {
                                modelView.passwordLength -= 1
                            }
                        }
                        .frame(width: 40, height: 40)
                        .background(Color(UIColor.systemIndigo))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        Spacer()
                        Text("\(modelView.passwordLength)")
                            .foregroundColor(Color.gray)
                        Spacer()
                        Button("+") {
                            modelView.passwordLength += 1
                        }
                        .frame(width: 40, height: 40)
                        .background(Color(UIColor.systemIndigo))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        Spacer()
                    }
                    .frame(width: 200, height: 50)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }.frame(height: 100)
            }.padding([.bottom, .top], 40)
            Button("Nueva contraseña") {
                modelView.createNewPassword()
            }
            .frame(width: 200, height: 50)
            .background(Color(UIColor.systemIndigo))
            .foregroundColor(.white)
            .cornerRadius(8)
            Spacer()
        }
    }
}

struct PassWordGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        PassWordGeneratorView()
    }
}
