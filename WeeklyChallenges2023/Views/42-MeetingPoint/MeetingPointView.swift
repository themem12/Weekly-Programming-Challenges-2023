//
//  MeetingPointView.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 02/01/25.
//

import SwiftUI

struct MeetingPointView: View {

    @ObservedObject var viewModel = MeetingPointViewModel()

    var body: some View {
        VStack {
            Text("First line")
                .font(.title3)
                .bold()
            HStack {
                TextField(text: $viewModel.xiLineAText) {
                    Text("x initial")
                }.textFieldStyle(OvalTextFieldStyle())
                TextField(text: $viewModel.yiLineAText) {
                    Text("y initial")
                }.textFieldStyle(OvalTextFieldStyle())
                TextField(text: $viewModel.xfLineAText) {
                    Text("x final")
                }.textFieldStyle(OvalTextFieldStyle())
                TextField(text: $viewModel.yfLineAText) {
                    Text("y final")
                }.textFieldStyle(OvalTextFieldStyle())
            }
            Text("Second line")
                .font(.title3)
                .bold()
            HStack {
                TextField(text: $viewModel.xiLineBText) {
                    Text("x initial")
                }.textFieldStyle(OvalTextFieldStyle())
                TextField(text: $viewModel.yiLineBText) {
                    Text("y initial")
                }.textFieldStyle(OvalTextFieldStyle())
                TextField(text: $viewModel.xfLineBText) {
                    Text("x final")
                }.textFieldStyle(OvalTextFieldStyle())
                TextField(text: $viewModel.yfLineBText) {
                    Text("y final")
                }.textFieldStyle(OvalTextFieldStyle())
            }
            BasicButton(
                buttonTittle: "Get meeting point",
                backgroundColor: .green
            ) {
                viewModel.getPoint()
            }
            Text(viewModel.xMeetingPoint + " " + viewModel.yMeetingPoint)
                .font(.title2)
                .bold()
        }
        .alert(viewModel.errorMessage, isPresented: $viewModel.error) {
            Button("Ok") {
                viewModel.error = false
                viewModel.errorMessage = ""
            }
        }
        .padding()
    }
}

#Preview {
    MeetingPointView()
}
