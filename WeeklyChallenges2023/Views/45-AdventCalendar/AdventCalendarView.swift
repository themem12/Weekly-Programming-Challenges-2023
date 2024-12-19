//
//  AdventCalendarView.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 18/12/24.
//

import SwiftUI

struct AdventCalendarView: View {

    @ObservedObject var viewModel = AdventCalendarViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter name", text: $viewModel.nameText)
                .textFieldStyle(OvalTextFieldStyle())
            HStack {
                BasicButton(
                    buttonTittle: "Save name",
                    backgroundColor: .green
                ) {
                    viewModel.saveNameTapped()
                }
                BasicButton(
                    buttonTittle: "Remove name",
                    backgroundColor: .red
                ) {
                    viewModel.deleteNameTapped()
                }
            }
            BasicButton(
                buttonTittle: "Get Winner",
                backgroundColor: .blue
            ) {
                viewModel.startLottery()
            }
            ScrollView {
                ForEach(viewModel.list, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
            }
        }
        .padding()
        .alert("Winner", isPresented: $viewModel.showWinnerAlert, actions: {
            Button {
                viewModel.showWinnerAlert = false
            } label: {
                Text("Continue lottery")
            }
        }, message: {
            Text(viewModel.winner)
                .font(.title)
        })
        .alert("Error", isPresented: $viewModel.showErrorAlert, actions: {
            Button {
                viewModel.showErrorAlert = false
            } label: {
                Text("Ok")
            }
        }, message: {
            Text(viewModel.error ?? "")
                .font(.title)
        })
    }
}

#Preview {
    AdventCalendarView()
}
