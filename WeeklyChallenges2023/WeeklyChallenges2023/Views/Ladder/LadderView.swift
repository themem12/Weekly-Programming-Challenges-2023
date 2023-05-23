//
//  LadderView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 29/04/23.
//

import SwiftUI

struct LadderView: View {
    
    @ObservedObject var viewModel = LadderViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    viewModel.isPositive = true
                } label: {
                    Text("+")
                }
                .font(.system(size: 80))
                .bold()
                
                Button {
                    viewModel.isPositive = false
                } label: {
                    Text("-")
                }
                .font(.system(size: 80))
                .bold()
            }
            TextField(text: $viewModel.numberOfSteps) {
                Text("Give me the number of steps")
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            
            Text(viewModel.ladderText)
        }
        .padding()
        .navigationTitle("Ladders")
    }
}

struct LadderView_Previews: PreviewProvider {
    static var previews: some View {
        LadderView()
    }
}
