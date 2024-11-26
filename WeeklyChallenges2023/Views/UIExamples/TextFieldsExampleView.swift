//
//  TextFieldsExampleView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 02/11/24.
//

import SwiftUI

struct TextFieldsExampleView: View {
    var body: some View {
        VStack {
            TextField("Enter your name", text: .constant(""))
                .textFieldStyle(OvalTextFieldStyle())
        }.padding()
    }
}

#Preview {
    TextFieldsExampleView()
}
