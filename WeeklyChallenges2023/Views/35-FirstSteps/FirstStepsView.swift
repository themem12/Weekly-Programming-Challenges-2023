//
//  FirstStepsView.swift
//  WeeklyChallenges2023
//
//  Created by Saavedra, Guillermo on 09/12/24.
//

import SwiftUI

struct FirstStepsView: View {

    @State var color: Int = 0
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Hello World")
                    .font(.largeTitle)
                Text("How to set a variable:")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text("var text: String = \"Thit is a String\"")
                    .font(.title3)
                Text("var integer: Int = 10")
                    .font(.title3)
                Text("var decimal: Double = 20.1")
                    .font(.title3)
                Text("var boolean: Bool = true")
                    .font(.title3)
                Text("How to set a constant:")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text("let constant = 1")
                    .font(.title3)
                Button {
                    if color == 0 {
                        color = 1
                    } else if color == 1 {
                        color = 2
                    } else if color == 2 {
                        color = 0
                    } else {
                        color = 0
                    }
                } label: {
                    Text("Tap for change color using an if else statement")
                        .background(color == 0 ? Color.red : color == 1 ? Color.blue : Color.green)
                        .foregroundStyle(Color.white)
                }
                Text("How to set an array:")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text("let array: [Int] = [1, 2, 3]")
                    .font(.title3)
                Text("How to set a tuple:")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text("let tuple = (name: \"Guillermo\", age: 28)")
                    .font(.title3)
                Text("How to set a dictionary:")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text("let dictionary: [String:String] = [\"name\": \"Guillermo\", \"surname\": \"Saavedra\"]")
                    .font(.title3)
                Text("How to set a function:")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text("func parameterlessFunction()")
                    .font(.title3)
                Text("How to set a function with a parameters:")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text("func parameterFunction(parameter: String)")
                    .font(.title3)
                Text("How to set a function with a return:")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text("func withReturn() -> String")
                    .font(.title3)
                Text("How to set a class:")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text("class YourClass { }")
                    .font(.title3)
                Text("How to handle errors:")
                    .font(.headline)
                    .foregroundStyle(.gray)
                Text("do { \n\ttry somethingRisky \n} catch { \n\tsomething went wrong \n}")
                    .font(.title3)
            }.padding(.horizontal)
        }.padding(.vertical)
    }
}

#Preview {
    FirstStepsView()
}
