//
//  TestingView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 12/01/25.
//

import SwiftUI

struct TestingView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("For this Challenge I set Unit Tests for all challenge's ViewModels and set every PR run them automatically before every commit is push using GitHub Actions.")
                .font(.title3)
                .bold()
                .multilineTextAlignment(.center)
            
            Link("Here is the folder with tests in the Challenges repository", destination: URL(string: "https://github.com/themem12/Weekly-Programming-Challenges-2023/tree/main/WeeklyChallenges2023Tests")!)
        }
    }
}

#Preview {
    TestingView()
}
