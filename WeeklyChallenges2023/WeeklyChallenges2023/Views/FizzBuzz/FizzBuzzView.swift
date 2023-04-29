//
//  FizzBuzzView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 29/12/22.
//

import SwiftUI

struct FizzBuzzView: View {
    let fizzbuzz:(Int) -> FizzBuzzModel = { i in
        switch (i % 3 == 0, i % 5 == 0)
        {
        case (true, false):
            return FizzBuzzModel(number: "\(i)", isFizzBuzz: "Fizz")
        case (false, true):
            return FizzBuzzModel(number: "\(i)", isFizzBuzz: "Buzz")
        case (true, true):
            return FizzBuzzModel(number: "\(i)", isFizzBuzz: "FizzBuzz")
        default:
            return FizzBuzzModel(number: "\(i)", isFizzBuzz: "")
        }
    }
    
    func createGrid(columns: Int) -> [[FizzBuzzModel]] {
        let array = Array(1...100).map(fizzbuzz)
        var rows = Double(array.count) / Double(columns)
        rows.round(.up)
        var grid = [[FizzBuzzModel]]()
        var newRow = [FizzBuzzModel]()
        for index in 0..<array.count {
            newRow.append(array[index])
            if index % columns == 0 {
                grid.append(newRow)
                newRow = []
            }
        }
        return grid
    }

    var body: some View {
        ScrollView {
            LazyVStack {
                let grid = createGrid(columns: 5)
                ForEach(grid, id: \.self) { row in
                    HStack {
                        ForEach(row) { item in
                            let title = item.isFizzBuzz == "" ? item.number : item.isFizzBuzz
                            Text(title)
                                .frame(width: 73, height: 40)
                                .background(Color.gray)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }.padding()
    }
}

struct FizzBuzzModel: Identifiable, Hashable {
    let number: String
    let isFizzBuzz: String
    let id = UUID()
}

struct FizzBuzzView_Previews: PreviewProvider {
    static var previews: some View {
        FizzBuzzView()
    }
}
