//
//  PrimeTwinsNumberView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 01/06/23.
//

import SwiftUI

struct PrimeTwinsNumberView: View {
    @StateObject var viewModel = PrimeTwinsNumberViewModel()
    var body: some View {
        VStack {
            TextField("Size of triforce: ", value: $viewModel.rangeNumber, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            Text(viewModel.primeTwinsNumbers)
        }
    }
}

struct PrimeTwinsNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PrimeTwinsNumberView()
    }
}
