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
                        .foregroundColor(.white)
                }
                .frame(width: 100, height: 50)
                .background(typeTranslate == .basic ? Color.green : Color.gray)
                .cornerRadius(10)
                
                Button {
                    typeTranslate = Alphabets.Alphabets.intermediate
                } label: {
                    Text("Intermediate")
                        .foregroundColor(.white)
                }
                .frame(width: 100, height: 50)
                .background(typeTranslate == .intermediate ? Color.green : Color.gray)
                .cornerRadius(10)
                
                Button {
                    typeTranslate = Alphabets.Alphabets.advande
                } label: {
                    Text("Advance")
                        .foregroundColor(.white)
                }
                .frame(width: 100, height: 50)
                .background(typeTranslate == .advande ? Color.green : Color.gray)
                .cornerRadius(10)
                
                Button {
                    typeTranslate = Alphabets.Alphabets.fullRetard
                } label: {
                    Text("Full retard")
                        .foregroundColor(.white)
                }
                .frame(width: 100, height: 50)
                .background(typeTranslate == .fullRetard ? Color.green : Color.gray)
                .cornerRadius(10)
            }
            .padding(8)
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
