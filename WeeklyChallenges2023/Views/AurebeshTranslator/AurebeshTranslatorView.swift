//
//  AurebeshTranslatorView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 14/04/23.
//

import SwiftUI

struct AurebeshTranslatorView: View {
    
    @ObservedObject var viewModel = AurebeshTranslatorViewModel()
    
    var body: some View {
        VStack {
            Text("Traductor a Aurebesh")
                .font(.system(size: 24, weight: .bold))
            TextField("Frase a traducir", text: $viewModel.textFieldString)
                .textFieldStyle(.roundedBorder)
            Text(viewModel.textFieldString).font(Font.custom("Aurebesh Bold", size: 20))
                .foregroundColor(.yellow)
        }
        .padding(16)
    }
}

struct AurebeshTranslatorView_Previews: PreviewProvider {
    static var previews: some View {
        AurebeshTranslatorView()
    }
}
