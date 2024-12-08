//
//  TXTViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 08/12/24.
//

import Foundation

final class TXTViewModel: ObservableObject {
    @Published var fieldText: String = ""
    @Published var txtContent: String = ""
    
    private var fileURL = URL(filePath: "")

    init() {
        fileURL = getDocumentsDirectory().appendingPathComponent("text.txt")
        retrieveText()
    }
    
    func saveText() {
        do {
            let newContent = txtContent + fieldText + "\n"
            try newContent.write(to: fileURL, atomically: true, encoding: .utf8)
            retrieveText()
        } catch {
            print("Error writing to file: \(error)")
        }
    }

    func retrieveText() {
        do {
            let fileContent = try String(contentsOf: fileURL)
            txtContent = fileContent
        } catch {
            print("File is missing, will create a new one once user saves")
        }
    }

    func deleteText() {
        do {
            try "".write(to: fileURL, atomically: true, encoding: .utf8)
            retrieveText()
        } catch {
            print("Error while deleting file: \(error.localizedDescription)")
        }
    }

    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
