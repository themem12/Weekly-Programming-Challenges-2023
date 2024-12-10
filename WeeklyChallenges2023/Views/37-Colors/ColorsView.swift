//
//  ColorsView.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 10/12/24.
//

import SwiftUI

struct ColorsView: View {
    
    @StateObject var viewModel = ColorsViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Set a color in Hex format:")
            
            TextField(text: $viewModel.hexText) {
                Text("#FFFFFF")
            }.textFieldStyle(OvalTextFieldStyle())

            HStack {
                BasicButton(buttonTittle: "Convert") {
                    viewModel.convertFromHexToRGB()
                }.frame(width: 150)

                Text("RGB result: \(viewModel.rgbValue)")
            }
            
            Text("Set a color in RGB format:")
            
            HStack {
                Text("R:")
                
                TextField(text: $viewModel.redText) {
                    Text("0 -> 255")
                }
                .textFieldStyle(OvalTextFieldStyle())
                .keyboardType(.decimalPad)
                
                Text("G:")
                
                TextField(text: $viewModel.greenText) {
                    Text("0 -> 255")
                }
                .textFieldStyle(OvalTextFieldStyle())
                .keyboardType(.decimalPad)
                
                Text("B:")
                
                TextField(text: $viewModel.blueText) {
                    Text("0 -> 255")
                }
                .textFieldStyle(OvalTextFieldStyle())
                .keyboardType(.decimalPad)
            }
            
            HStack {
                BasicButton(buttonTittle: "Convert") {
                    viewModel.convertFromRGBToHex()
                }.frame(width: 150)

                Text("Hex result: \(viewModel.hexValue)")
            }
        }.padding()
    }
}

#Preview {
    ColorsView()
}
