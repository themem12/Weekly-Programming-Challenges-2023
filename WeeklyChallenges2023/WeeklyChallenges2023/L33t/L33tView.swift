//
//  L33tView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 07/01/23.
//

import SwiftUI

struct L33tView: View {
    
    @State var textToTranslate: String = ""
    @State var typeTranslate: Alphabets.Alphabets = Alphabets.Alphabets.basic
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Button {
                    typeTranslate = Alphabets.Alphabets.basic
                } label: {
                    Text("Basic")
                        .background(Color.blue)
                        .foregroundColor(.white)
                }
                
                Button {
                    typeTranslate = Alphabets.Alphabets.intermediate
                } label: {
                    Text("Intermediate")
                        .background(Color.blue)
                        .foregroundColor(.white)
                }
                
                Button {
                    typeTranslate = Alphabets.Alphabets.advande
                } label: {
                    Text("Advance")
                        .background(Color.blue)
                        .foregroundColor(.white)
                }
                
                Button {
                    typeTranslate = Alphabets.Alphabets.fullRetard
                } label: {
                    Text("Full retard")
                        .background(Color.blue)
                        .foregroundColor(.white)
                }
            }
            TextField(text: $textToTranslate) {
                Text("Escribe el mensaje a traducir")
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(height: 50)
            .padding()
            
            Text(textToTranslate.translateTo(typeTranslate))
            
            Spacer()
        }
    }
}

struct L33tView_Previews: PreviewProvider {
    static var previews: some View {
        L33tView()
    }
}
