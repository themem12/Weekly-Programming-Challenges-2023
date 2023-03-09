//
//  Hete-Iso-PangramaViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 08/03/23.
//

import Foundation

class Hete_Iso_PangramaViewModel: ObservableObject {
    @Published var textToEvaluate: String = "" {
        didSet {
            cleanPhrase()
        }
    }
    @Published var isHeter = false
    @Published var isIso = false
    @Published var isPan = false
    
    func cleanPhrase() {
        let phraseCleaned = textToEvaluate.filter({ $0 != "," && $0 != " " }).lowercased()
        if phraseCleaned.isEmpty {
            isHeter = false
            isPan = false
            isIso = false
            return
        }
        setPhraseToDic(phraseCleaned)
    }
    
    func setPhraseToDic(_ phrase: String) {
        var alphabetDic = [String: Int]()
        for char in phrase {
            let count = alphabetDic["\(char)"] ?? 0
            alphabetDic["\(char)"] = count + 1
        }
        phraseIsHeteOrPan(phraseDic: alphabetDic)
        phraseIsIso(phraseDic: alphabetDic)
    }

    func phraseIsHeteOrPan(phraseDic: [String: Int]) {
        for count in phraseDic.values {
            if count > 1 {
                isHeter = false
                isPan = true
                return
            }
        }
        isHeter = true
        isPan = false
    }
    
    func phraseIsIso(phraseDic: [String: Int]) {
        if phraseDic.count == 26 {
            isIso = true
        } else {
            isIso = false
        }
    }
}
