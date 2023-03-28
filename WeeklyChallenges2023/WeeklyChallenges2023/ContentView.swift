//
//  ContentView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 29/12/22.
//

import SwiftUI

struct ContentView: View {
    let cells = [
        ChallengesCells(title: "FizzBuzz"),
        ChallengesCells(title: "L33t"),
        ChallengesCells(title: "Tennis game"),
        ChallengesCells(title: "Password Generator"),
        ChallengesCells(title: "Prime Fibonachi or Pair"),
        ChallengesCells(title: "Hola Mundo"),
        ChallengesCells(title: "Rock Paper Sissors Lizard Spock"),
        ChallengesCells(title: "Sorting Hat"),
        ChallengesCells(title: "Pseudorandom"),
        ChallengesCells(title: "Hete-Iso-Pag gram"),
        ChallengesCells(title: "API"),
        ChallengesCells(title: "URLParams"),
        ChallengesCells(title: "Friday 13"),
    ]
    var body: some View {
        NavigationView {
            List(cells) { cell in
                switch cell.title {
                case "FizzBuzz":
                    NavigationLink(destination: FizzBuzzView()) {
                        Text(cell.title)
                    }
                case "L33t":
                    NavigationLink(destination: L33tView()) {
                        Text(cell.title)
                    }
                case "Tennis game":
                    NavigationLink(destination: TennisGameView()) {
                        Text("\(cell.title)")
                    }
                case "Password Generator":
                    NavigationLink(destination: PassWordGeneratorView()) {
                        Text(cell.title)
                    }
                case "Prime Fibonachi or Pair":
                    NavigationLink(destination: PrimeFibonachiPairView()) {
                        Text(cell.title)
                    }
                case "Hola Mundo":
                    NavigationLink(destination: HolaMundoView()) {
                        Text("\(cell.title)")
                    }
                case "Rock Paper Sissors Lizard Spock":
                    NavigationLink(destination: RPSLSView()) {
                        Text(cell.title)
                    }
                case "Sorting Hat":
                    NavigationLink(destination: SortingHatView()) {
                        Text("\(cell.title)")
                    }
                case "Pseudorandom":
                    NavigationLink(destination: Pseudorandom()) {
                        Text(cell.title)
                    }
                case "Hete-Iso-Pag gram":
                    NavigationLink(destination: Hete_Iso_PangramaView()) {
                        Text(cell.title)
                    }
                case "API":
                    NavigationLink(destination: APIView()) {
                        Text("\(cell.title)")
                    }
                case "URLParams":
                    NavigationLink(destination: URLParamsView()) {
                        Text("\(cell.title)")
                    }
                case "Friday 13":
                    NavigationLink(destination: FridayThirteenView()) {
                        Text(cell.title)
                    }
                default:
                    NavigationLink(destination: FizzBuzzView()) {
                        Text(cell.title)
                    }
                }
            }
            .navigationBarTitle("Retos semanales 2023")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ChallengesCells: Identifiable {
    let title: String
    let id = UUID()
}
