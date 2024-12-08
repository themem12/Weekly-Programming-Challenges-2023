//
//  TXTView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 08/12/24.
//

import SwiftUI

struct TXTView: View {
    
    @StateObject var viewModel = TXTViewModel()
    
    var body: some View {
        VStack {
            TextField("Write to text.txt", text: $viewModel.fieldText)
                .textFieldStyle(OvalTextFieldStyle())
            
            BasicButton(
                buttonTittle: "Save",
                backgroundColor: .green,
                fontSize: 24) {
                    viewModel.saveText()
                }
                .frame(width: 200)
            
            BasicButton(
                buttonTittle: "Delete",
                backgroundColor: .red,
                fontSize: 24) {
                    viewModel.deleteText()
                }
                .frame(width: 200)
            
            Text(viewModel.txtContent)
        }.padding()
    }
}

#Preview {
    TXTView()
}
