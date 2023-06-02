//
//  TriforceView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 29/05/23.
//

import SwiftUI

struct TriforceView: View {
    @State var triforceSize = 5
    var body: some View {
        VStack {
            Text(getTriforceText())
                .multilineTextAlignment(.leading)
            TextField("Size of triforce: ", value: $triforceSize, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
        }.padding()
    }
    
    private func getTriforceText() -> String {
        let baseLenght = (triforceSize * 2) - 1
        var triForceString = ""
        for row in 0..<triforceSize * 2 {
            if row < triforceSize {
                let spacesCount = (triforceSize - (row - triforceSize)) - 1
                let middleSpaces = String(repeating: " ", count: spacesCount)
                let asterisks = String(repeating: "*", count: (2 * (row) + 1))
                triForceString.append("\(middleSpaces)\(asterisks)")
            } else {
                let asterisks = String(repeating: "*", count: (2 * (row - triforceSize) + 1))
                let spacesCount = (triforceSize - (row - triforceSize)) - 1
                let spaces = String(repeating: " ", count: spacesCount)
                let middleSpaces = String(repeating: " ", count: (spacesCount * 2)+1)
                triForceString.append("\(spaces)\(asterisks)\(middleSpaces)\(asterisks)")
//                let current_row = row - triforceSize
//                let start_space = String(repeating: " ", count: ((triforceSize - current_row) - 1))
//                let middle_space = String(repeating: " ", count: ((2 * (triforceSize - current_row)) - 1))
//                let print_row = String(repeating: "*", count: ((2 * (current_row + 1)) - 1))
//                triForceString.append("\(start_space)\(print_row)\(middle_space)\(print_row)")
            }
            triForceString.append("\n")
        }
        return triForceString
    }
}

struct TriforceView_Previews: PreviewProvider {
    static var previews: some View {
        TriforceView()
    }
}

//1,3,5,7,9,11
//0,1,2,3,4,5
