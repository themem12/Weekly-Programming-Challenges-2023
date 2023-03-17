//
//  URLParamsView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 16/03/23.
//

import SwiftUI

struct URLParamsView: View {
    @StateObject private var viewModel = URLParamsViewModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Spacer()
            TextField("Dame la url", text: $viewModel.fieldText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Parámetros:")
                .fontWeight(.medium)
                .foregroundColor(.gray)
            List(viewModel.urlParams, id: \.self) { params in
                Text(params)
            }
        }
        .padding(16)
        //https://retosdeprogramacion.com?year=2023&challenge=0
    }
}

struct URLParamsView_Previews: PreviewProvider {
    static var previews: some View {
        URLParamsView()
    }
}
