//
//  PrimeFibonachiPairView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 06/03/23.
//

import SwiftUI

struct PrimeFibonachiPairView: View {
    
    @StateObject var viewModel = PrimeFibonachiPairViewModel()
    
    var body: some View {
        VStack {
            TextField("Dame un valor ", text: $viewModel.evaluationValue)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
            HStack {
                Text("Primo")
                    .frame(width: 80)
                    .padding(20)
                    .background(viewModel.isPrimeNumber ? Color.green : Color.gray)
                    .cornerRadius(10)
                Text("Fibonachi")
                    .frame(width: 80)
                    .padding(20)
                    .background(viewModel.isFibonachiNumber ? Color.green : Color.gray)
                    .cornerRadius(10)
                Text("Par")
                    .frame(width: 80)
                    .padding(20)
                    .background(viewModel.isPairNumber ? Color.green : Color.gray)
                    .cornerRadius(10)
            }
        }
        .padding([.trailing, .leading])
    }
}

struct PrimeFibonachiPairView_Previews: PreviewProvider {
    static var previews: some View {
        PrimeFibonachiPairView()
    }
}
