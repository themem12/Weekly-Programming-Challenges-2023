//
//  GitCommitsViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 03/05/23.
//

import Foundation



struct CommitModel: Codable, Identifiable {
    let id = UUID()
    let commit: CommitData
    
    enum CodingKeys: String, CodingKey {
        case commit
    }
}

struct CommitData: Codable {
    let author: CommitAuthor
    let message: String
}

struct CommitAuthor: Codable {
    let name: String
    let email: String
    let date: String
}

class GitCommitsViewModel: ObservableObject {
    private let url = "https://api.github.com/repos/themem12/Weekly-Programming-Challenges-2023/commits"
    private let serviceLayer: ServiceLayer!
    
    @Published var commits = [CommitModel]()
    
    init(serviceLayer: ServiceLayer! = ServiceLayer()) {
        self.serviceLayer = serviceLayer
        getCommits()
    }
    
    private func getCommits() {
        serviceLayer.callApi(resultType: [CommitModel].self, url: url) { [weak self] commitInfo in
            guard let commitInfo = commitInfo else { return }
            DispatchQueue.main.async {
                self?.commits = commitInfo
            }
        }
    }
}

extension String {
    var getCleanDate: String {
        return "\(self.split(separator: "T").first ?? "")"
    }
}
