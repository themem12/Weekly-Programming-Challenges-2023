//
//  SpiralView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 01/06/23.
//

import SwiftUI

struct SpiralView: View {
    @StateObject var viewModel = SpiralViewModel()
    var body: some View {
        VStack {
            TextField("Spiral size", value: $viewModel.size, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            Text(viewModel.spiralString)
        }
    }
}

struct SpiralView_Previews: PreviewProvider {
    static var previews: some View {
        SpiralView()
    }
}
