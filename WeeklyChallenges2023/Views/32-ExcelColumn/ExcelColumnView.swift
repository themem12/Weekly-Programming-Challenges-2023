//
//  ExcelColumnView.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 25/11/24.
//

import SwiftUI

struct ExcelColumnView: View {
    
    @StateObject var viewModel = ExcelColumnViewModel()
    
    var body: some View {
        VStack {
            TextField("Column name", text: $viewModel.text)
                .textFieldStyle(OvalTextFieldStyle())
            Text("Column number: \(viewModel.columnNumber)")
        }
        .alert(viewModel.errorString ?? "", isPresented: $viewModel.isInvalid) {
            Button("Let me change them", role: .cancel) {
                viewModel.isInvalid = false
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ExcelColumnView()
}
