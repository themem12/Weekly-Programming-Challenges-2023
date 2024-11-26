//
//  APIView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 08/03/23.
//

import SwiftUI

struct APIView: View {
    @StateObject private var viewModel = APIViewModel()
    var body: some View {
        VStack {
            ZStack {
                Button {
                    if !viewModel.isLoading {
                        viewModel.getAPIResponse()
                    }
                } label: {
                    Text("Hacer petición")
                        .padding(50)
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            Text(viewModel.apiResponse)
        }
    }
}

struct APIView_Previews: PreviewProvider {
    static var previews: some View {
        APIView()
    }
}
