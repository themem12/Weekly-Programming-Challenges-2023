//
//  FridayThirteenView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 27/03/23.
//

import SwiftUI

struct FridayThirteenView: View {
    @StateObject var viewModel = FridayThirteenViewModel()
    var body: some View {
        VStack(spacing: 16) {
            TextField("Dame el mes", text: $viewModel.numberMonth)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            TextField("Dame el año", text: $viewModel.numberYear)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            Text(viewModel.haveFridayThirteen)
        }.padding(16)
    }
}

struct FridayThirteenView_Previews: PreviewProvider {
    static var previews: some View {
        FridayThirteenView()
    }
}
