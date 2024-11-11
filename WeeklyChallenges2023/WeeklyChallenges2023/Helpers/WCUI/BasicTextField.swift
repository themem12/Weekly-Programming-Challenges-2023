//
//  BasicTextField.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 02/11/24.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(.gray)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 10)
    }
}

#Preview {
    HStack {
        TextField("", text: .constant(""))
            .textFieldStyle(OvalTextFieldStyle())
    }
}
