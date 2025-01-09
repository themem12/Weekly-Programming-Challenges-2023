//
//  MeetingPointViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 31/12/24.
//

import Foundation

final class MeetingPointViewModel: ObservableObject {
    struct LineModel {
        let initialX: Int
        let initialY: Int
        let finalX: Int
        let finalY: Int
        let equation: String
        var m: Float
        var b: Float
    }

    @Published var xiLineAText: String = ""
    @Published var yiLineAText: String = ""
    @Published var xfLineAText: String = ""
    @Published var yfLineAText: String = ""

    @Published var xiLineBText: String = ""
    @Published var yiLineBText: String = ""
    @Published var xfLineBText: String = ""
    @Published var yfLineBText: String = ""
    
    @Published var firstLine: LineModel?
    @Published var secondLine: LineModel?

    @Published var xMeetingPoint: String = ""
    @Published var yMeetingPoint: String = ""
    @Published var error: Bool = false
    @Published var errorMessage: String = ""

    public func getPoint() {
        setLines()
        guard let point = resolveEquationSystem() else { return }
        xMeetingPoint = "x: \(point.0)"
        yMeetingPoint = "y: \(point.1)"
    }

    private func setLines() {
        guard let xiLineA = Int(xiLineAText) else {
            error = true
            errorMessage = "Invalid value"
            return
        }
        guard let yiLineA = Int(yiLineAText) else {
            error = true
            errorMessage = "Invalid value"
            return
        }
        guard let xfLineA = Int(xfLineAText) else {
            error = true
            errorMessage = "Invalid value"
            return
        }
        guard let yfLineA = Int(yfLineAText) else {
            error = true
            errorMessage = "Invalid value"
            return
        }
        guard let xiLineB = Int(xiLineBText) else {
            error = true
            errorMessage = "Invalid value"
            return
        }
        guard let yiLineB = Int(yiLineBText) else {
            error = true
            errorMessage = "Invalid value"
            return
        }
        guard let xfLineB = Int(xfLineBText) else {
            error = true
            errorMessage = "Invalid value"
            return
        }
        guard let yfLineB = Int(yfLineBText) else {
            error = true
            errorMessage = "Invalid value"
            return
        }

        let firstEquation = getEquation(
            xi: xiLineA,
            yi: yiLineA,
            xf: xfLineA,
            yf: yfLineA
        )
        firstLine = .init(
            initialX: xiLineA,
            initialY: yiLineA,
            finalX: xfLineA,
            finalY: yfLineA,
            equation: firstEquation.0,
            m: firstEquation.1,
            b: firstEquation.2
        )
        let secondEquation = getEquation(
            xi: xiLineB,
            yi: yiLineB,
            xf: xfLineB,
            yf: yfLineB
        )
        secondLine = .init(
            initialX: xiLineB,
            initialY: yiLineB,
            finalX: xfLineB,
            finalY: yfLineB,
            equation: secondEquation.0,
            m: secondEquation.1,
            b: secondEquation.2
        )
    }

    private func getEquation(xi: Int, yi: Int, xf: Int, yf: Int) -> (String, Float, Float) {
        let firstParenthesis: Float = Float(yf-yi)
        let secondParenthesis: Float = Float(xf-xi)
        let x1: Float = firstParenthesis * Float(-1*xi)
        let y1: Float = secondParenthesis * Float(-1*yi)
        let difference: Float = Float(x1-y1)
        let m = firstParenthesis/secondParenthesis
        let b = difference/secondParenthesis
        // y = mx+b
        return ("y=\(m)x\(difference < 0 ? "" : "+")\(b)", m, b)
    }

    private func resolveEquationSystem() -> (Float, Float)? {
        guard let m1 = firstLine?.m else {
            error = true
            errorMessage = "Invalid value"
            return nil
        }
        guard let b1 = firstLine?.b else {
            error = true
            errorMessage = "Invalid value"
            return nil
        }
        guard let m2 = secondLine?.m else {
            error = true
            errorMessage = "Invalid value"
            return nil
        }
        guard let b2 = secondLine?.b else {
            error = true
            errorMessage = "Invalid value"
            return nil
        }

        let slope = m1 - m2
        let origin = b2 - b1

        let x = origin / slope
        let y = (m1 * x) + b1

        guard !Double(x).isInfinite || !Double(y).isNaN else {
            error = true
            errorMessage = "Lines won't meet"
            return nil
        }
        return (x, y)
    }
}
