//
//  Pseudorandom.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 07/03/23.
//

import SwiftUI

struct Pseudorandom: View {
    @State var randomNumber = 0
    var body: some View {
        VStack {
            Button("Random") {
                randomNumber = Calendar.current.component(.nanosecond, from: Date()) % 101
            }
            .padding(20)
            .background(Color.gray)
            .cornerRadius(10)
            .foregroundColor(.white)
            Text("\(randomNumber)")
                .font(.largeTitle)
                .foregroundColor(.gray)
        }
    }
}

struct Pseudorandom_Previews: PreviewProvider {
    static var previews: some View {
        Pseudorandom()
    }
}
