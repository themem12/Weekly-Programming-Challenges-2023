//
//  AdventCalendarViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 18/12/24.
//

import Foundation

final class AdventCalendarViewModel: ObservableObject {

    @Published var nameText: String = ""
    @Published var list: [String] = []
    @Published var showWinnerAlert: Bool = false
    @Published var showErrorAlert: Bool = false

    var winner: String = ""
    var error: String? = nil

    public func saveNameTapped() {
        error = nil
        guard !nameText.isEmpty else { return showError("Name text is empty") }
        guard !list.contains(nameText) else { return showError("Name already in list") }
        list.append(nameText)
        nameText = ""
    }

    public func deleteNameTapped() {
        error = nil
        guard !nameText.isEmpty else { return showError("Name text is empty") }
        removeName(nameText)
        nameText = ""
    }

    public func startLottery() {
        error = nil
        guard list.count > 0 else { return showError("List is empty") }
        let random = Int.random(in: 0..<list.count)
        winner = list[random]
        removeName(winner)
        showWinnerAlert = true
    }

    private func removeName(_ name: String) {
        guard let index = list.firstIndex(of: name) else { return showError("Name not found in list") }
        list.remove(at: index)
    }

    private func showError(_ errorText: String) {
        error = errorText
        showErrorAlert = true
    }
}
