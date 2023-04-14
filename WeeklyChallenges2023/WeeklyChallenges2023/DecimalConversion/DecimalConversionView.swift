//
//  DecimalConversionView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 14/04/23.
//

import SwiftUI

struct DecimalConversionView: View {
    
    @ObservedObject var viewModel = DecimalConversionViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Dame un número entero para convertirlo en base octal y base hexadecimal")
                .multilineTextAlignment(.center)
            
            Spacer()
                .frame(height: 20)
            
            TextField("Valor", text: $viewModel.numberToConvert)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text(viewModel.infoString)
                .multilineTextAlignment(.leading)
                .foregroundColor(.red)
                .fontWeight(.heavy)
                .font(.system(size: 12))
            
            Spacer()
                .frame(height: 20)
            
            HStack(spacing: 16) {
                Spacer()
                VStack {
                    Text("Octal")
                    Text(viewModel.octalString)
                }
                VStack {
                    Text("Hexadecimal")
                    Text(viewModel.hexalString)
                }
                Spacer()
            }
        }
        .padding(16)
    }
}

struct DecimalConversionView_Previews: PreviewProvider {
    static var previews: some View {
        DecimalConversionView()
    }
}
