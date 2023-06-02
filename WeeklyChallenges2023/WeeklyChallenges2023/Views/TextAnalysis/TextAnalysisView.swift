//
//  TextAnalysisView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 24/05/23.
//

import SwiftUI

struct TextAnalysisView: View {
    
    @StateObject private var viewModel = TextAnalysisViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextField("Phrase to analys", text: $viewModel.textString)
                .textFieldStyle(.roundedBorder)
            Spacer().frame(height: 10)
            HStack {
                Text("Word count: ")
                    .multilineTextAlignment(.center)
                Text("\(viewModel.wordCount)")
            }
            HStack {
                Text("Average letter count in words: ")
                    .multilineTextAlignment(.center)
                Text("\(viewModel.averageLettersInWords)")
            }
            HStack {
                Text("Phrases count: ")
                    .multilineTextAlignment(.center)
                Text("\(viewModel.phrasesCount)")
            }
            Text("Longest word: ")
                .multilineTextAlignment(.center)
            Text(viewModel.longestWord)
            Spacer()
        }
        .padding()
        .navigationTitle("Text analysis")
    }
}

struct TextAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        TextAnalysisView()
    }
}
