//
//  ContentView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes on 29/12/22.
//

import SwiftUI

struct ContentView: View {
    private let uiExamples = [
        ChallengesCells(title: "Buttons", viewClass: AnyView(ButtonsExampleView())),
        ChallengesCells(title: "TextFields", viewClass: AnyView(TextFieldsExampleView()))
    ]
    private let challenges = [
        ChallengesCells(title: "FizzBuzz", viewClass: AnyView(FizzBuzzView())),
        ChallengesCells(title: "L33t", viewClass: AnyView(L33tView())),
        ChallengesCells(title: "Tennis game", viewClass: AnyView(TennisGameView())),
        ChallengesCells(title: "Password Generator", viewClass: AnyView(PassWordGeneratorView())),
        ChallengesCells(title: "Prime Fibonachi or Pair", viewClass: AnyView(PrimeFibonachiPairView())),
        ChallengesCells(title: "Hola Mundo", viewClass: AnyView(HolaMundoView())),
        ChallengesCells(title: "Rock Paper Sissors Lizard Spock", viewClass: AnyView(RPSLSView())),
        ChallengesCells(title: "Sorting Hat", viewClass: AnyView(SortingHatView())),
        ChallengesCells(title: "Pseudorandom", viewClass: AnyView(Pseudorandom())),
        ChallengesCells(title: "Hete-Iso-Pag gram", viewClass: AnyView(Hete_Iso_PangramaView())),
        ChallengesCells(title: "API", viewClass: AnyView(APIView())),
        ChallengesCells(title: "URLParams", viewClass: AnyView(URLParamsView())),
        ChallengesCells(title: "Friday 13", viewClass: AnyView(FridayThirteenView())),
        ChallengesCells(title: "Guess the word", viewClass: AnyView(WordGuessView())),
        ChallengesCells(title: "Decimal conversion", viewClass: AnyView(DecimalConversionView())),
        ChallengesCells(title: "Aurebesh translator", viewClass: AnyView(AurebeshTranslatorView())),
        ChallengesCells(title: "Ladders", viewClass: AnyView(LadderView())),
        ChallengesCells(title: "Git commits", viewClass: AnyView(GitCommitsListView())),
        ChallengesCells(title: "Web Scraping", viewClass: AnyView(WebScrapingView())),
        ChallengesCells(title: "Text Analysis", viewClass: AnyView(TextAnalysisView())),
        ChallengesCells(title: "Triforce", viewClass: AnyView(TriforceView())),
        ChallengesCells(title: "Prime Twins Numbers", viewClass: AnyView(PrimeTwinsNumberView())),
        ChallengesCells(title: "Spiral", viewClass: AnyView(SpiralView())),
        ChallengesCells(title: "Cesar Cypher", viewClass: AnyView(CesarCypherView())),
        ChallengesCells(title: "Konami Code", viewClass: AnyView(KonamiCodeView())),
        ChallengesCells(title: "Countdown", viewClass: AnyView(CountdownView())),
        ChallengesCells(title: "Infiltrated Characters", viewClass: AnyView(InfiltratedCharacterView())),
        ChallengesCells(title: "T9 Keyboard", viewClass: AnyView(T9KeyboardView())),
        ChallengesCells(title: "Abacus", viewClass: AnyView(AbacusView())),
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section("UI Examples") {
                    ForEach(uiExamples) { cell in
                        NavigationLink(destination: cell.viewClass) {
                            Text(cell.title)
                        }
                    }
                }
                Section("Challenges") {
                    ForEach(challenges) { cell in
                        NavigationLink(destination: cell.viewClass) {
                            Text(cell.title)
                        }
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
    let viewClass: AnyView
    let id = UUID()
}
