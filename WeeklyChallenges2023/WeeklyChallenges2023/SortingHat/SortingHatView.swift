//
//  SortingHatView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 08/03/23.
//

import SwiftUI

struct SortingHatView: View {
    @StateObject private var viewModel = SortingHatViewModel()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Image("Sorting_Hat")
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.bottom, 64)
            Text(viewModel.questionString)
                .font(.largeTitle)
                .foregroundColor(.gray)
            HStack(spacing: 32) {
                Button {
                    viewModel.validationResponse(viewModel.getAsnwerOneString())
                } label: {
                    Text(viewModel.getAsnwerOneString())
                }
                .frame(width: 80, height: 80)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button {
                    viewModel.validationResponse(viewModel.getAsnwerTwoString())
                } label: {
                    Text(viewModel.getAsnwerTwoString())
                }
                .frame(width: 80, height: 80)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            Spacer()
        }.alert(viewModel.houseSelected, isPresented: $viewModel.showHouse) {
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("🥳")
            }

        }
    }
}

struct SortingHatView_Previews: PreviewProvider {
    static var previews: some View {
        SortingHatView()
    }
}
