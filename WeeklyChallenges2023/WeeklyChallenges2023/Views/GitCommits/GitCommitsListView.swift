//
//  GitCommitsListView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 22/05/23.
//

import SwiftUI

struct GitCommitsListView: View {
    @StateObject var viewModel = GitCommitsViewModel()
    
    var body: some View {
        List(viewModel.commits) { commit in
            VStack(alignment: .leading) {
                Text(commit.commit.author.name)
                    .font(.title)
                    .bold()
                Text(commit.commit.author.email)
                    .font(.system(size: 12))
                    .italic()
                Text(commit.commit.message)
                HStack {
                    Spacer()
                    Text(commit.commit.author.date.getCleanDate)
                        .font(.system(size: 10))
                }
            }
        }.navigationTitle("Repo commits")
    }
}

struct GitCommitsListView_Previews: PreviewProvider {
    static var previews: some View {
        GitCommitsListView()
    }
}
