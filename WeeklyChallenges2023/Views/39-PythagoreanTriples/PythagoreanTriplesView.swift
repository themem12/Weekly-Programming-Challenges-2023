//
//  PythagoreanTriplesView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 15/12/24.
//

import SwiftUI

struct PythagoreanTriplesView: View {

    @ObservedObject var viewModel = PythagoreanTriplesViewModel()
    
    var body: some View {
        VStack {
            HStack() {
                Text("Give max number:")
                TextField("Number", text: $viewModel.maxNumberText)
                    .textFieldStyle(OvalTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            BasicButton(buttonTittle: "Get Triples") {
                viewModel.getPythagoreanTriples()
            }
            ScrollView {
                ForEach(viewModel.pythagoreanTriples, id: \.self) { triple in
                    Text(triple)
                        .font(.title)
                }
            }
        }.padding()
    }
}

#Preview {
    PythagoreanTriplesView()
}
