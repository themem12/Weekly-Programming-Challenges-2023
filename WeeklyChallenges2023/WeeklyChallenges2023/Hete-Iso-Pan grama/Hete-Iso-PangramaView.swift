//
//  Hete-Iso-PangramaView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 08/03/23.
//

import SwiftUI

struct Hete_Iso_PangramaView: View {
    
    @StateObject private var viewModel = Hete_Iso_PangramaViewModel()
    
    @State private var textToEvaluate: String = ""
    @State private var isHeter = false
    @State private var isIso = false
    @State private var isPan = false
    
    var body: some View {
        VStack {
            TextField("Dame una frase", text: $viewModel.textToEvaluate)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 16)
            HStack {
                Text("Heterograma")
                    .frame(width: 100, height: 60)
                    .padding(10)
                    .background(viewModel.isHeter ? Color.green : Color.gray)
                    .cornerRadius(10)
                Text("Isograma")
                    .frame(width: 100, height: 60)
                    .padding(10)
                    .background(viewModel.isIso ? Color.green : Color.gray)
                    .cornerRadius(10)
                Text("Panagrama")
                    .frame(width: 100, height: 60)
                    .padding(10)
                    .background(viewModel.isPan ? Color.green : Color.gray)
                    .cornerRadius(10)
            }
            .foregroundColor(.white)
        }
        .padding(16)
    }
}

struct Hete_Iso_PangramaView_Previews: PreviewProvider {
    static var previews: some View {
        Hete_Iso_PangramaView()
    }
}
