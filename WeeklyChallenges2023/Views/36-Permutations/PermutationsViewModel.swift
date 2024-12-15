//
//  PermutationsViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 09/12/24.
//

import Foundation

final class PermutationsViewModel: ObservableObject {

    @Published var wordToPermute = ""
    @Published var permutations = [String]()
    
    private func permutation(prefix: String = "", suf: String, permutations: inout [String]) {
        guard !suf.isEmpty else { return permutations.append(prefix) }
        for letter in suf {
            let newPrefix = prefix + String(letter)
            var newSuf = ""
            if let index = suf.firstIndex(of: letter) {
                newSuf = String(suf.prefix(upTo: index) + suf.suffix(from: suf.index(after: index)))
            }
            permutation(prefix: newPrefix, suf: newSuf, permutations: &permutations)
        }
    }

    public func startPermutations() {
        guard !wordToPermute.isEmpty else { return permutations = ["Can't permute an empty word"] }
        permutations = []
        permutation(suf: wordToPermute, permutations: &permutations)
    }
}
