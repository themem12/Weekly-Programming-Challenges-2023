//
//  FridayThirteenViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 24/03/23.
//

import Foundation

class FridayThirteenViewModel: ObservableObject {
    @Published var numberYear: String = "" {
        didSet {
            validateFriday()
        }
    }
    @Published var numberMonth: String = "" {
        didSet {
            validateFriday()
        }
    }
    @Published var haveFridayThirteen: String = "Agrega los valores"
    
    private func validateFriday() {
        if numberYear.isEmpty || numberMonth.isEmpty {
            haveFridayThirteen = "Agrega los valores"
            return
        }
        
        guard let month = Int(numberMonth), let year = Int(numberYear), month <= 12 else {
            haveFridayThirteen = "Valor inváldo"
            return
        }
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = 13

        // Create date from components
        let userCalendar = Calendar(identifier: .gregorian)
        guard let dateSet = userCalendar.date(from: dateComponents) else {
            haveFridayThirteen = "Valor inváldo"
            return
        }
        
        let formater = DateFormatter()
        formater.dateFormat = "EEEE"
        let dayString = formater.string(from: dateSet)
        print(dayString)
        
        if dayString.lowercased() == "viernes" {
            haveFridayThirteen = "Si hay viernes 13"
        } else {
            haveFridayThirteen = "No hay viernes 13"
        }
    }
}
