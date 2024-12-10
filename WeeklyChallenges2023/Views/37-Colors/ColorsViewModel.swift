//
//  ColorsViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 10/12/24.
//

import Foundation

final class ColorsViewModel: ObservableObject {
    
    @Published var redText: String = ""
    @Published var greenText: String = ""
    @Published var blueText: String = ""
    @Published var hexText: String = ""

    @Published var hexValue: String = ""
    @Published var rgbValue: String = ""

    func convertFromHexToRGB() {
        let array = Array(hexText).map { String($0) }
        guard array.count == 6 else {
            return rgbValue = "Not a valid value"
        }
        guard let red = Int(array[0] + array[1], radix: 16) else { return rgbValue = "Not a valid value for red" }
        guard let green = Int(array[2] + array[3], radix: 16) else { return rgbValue = "Not a valid value for green" }
        guard let blue = Int(array[4] + array[5], radix: 16) else { return rgbValue = "Not a valid value for blue" }

        rgbValue = "\(red), \(green), \(blue)"
    }

    func convertFromRGBToHex() {
        guard let red = Int(redText), red <= 255, red >= 0 else { return hexValue = "Red value is invalid" }
        guard let green = Int(greenText), green <= 255, green >= 0 else { return hexValue = "Green value is invalid"  }
        guard let blue = Int(blueText), blue <= 255, blue >= 0 else { return hexValue = "Blue value is invalid"  }

        let hexRed = String(red, radix: 16)
        let hexGreen = String(green, radix: 16)
        let hexBlue = String(blue, radix: 16)

        let newHexValue = "#" + (hexRed == "0" ? "00" : hexRed) + (hexGreen == "0" ? "00" : hexGreen) + (hexBlue == "0" ? "00" : hexBlue)
        hexValue = newHexValue.uppercased()
    }
}
