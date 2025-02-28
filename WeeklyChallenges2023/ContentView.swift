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
        ChallengesCells(title: "0 - FizzBuzz", viewClass: AnyView(FizzBuzzView())),
        ChallengesCells(title: "1 - L33t", viewClass: AnyView(L33tView())),
        ChallengesCells(title: "2 - Tennis game", viewClass: AnyView(TennisGameView())),
        ChallengesCells(title: "3 - Password Generator", viewClass: AnyView(PassWordGeneratorView())),
        ChallengesCells(title: "4 - Prime Fibonachi or Pair", viewClass: AnyView(PrimeFibonachiPairView())),
        ChallengesCells(title: "5 - Hello World", viewClass: AnyView(HelloWorldView())),
        ChallengesCells(title: "6 - Rock Paper Sissors Lizard Spock", viewClass: AnyView(RPSLSView())),
        ChallengesCells(title: "7 - Sorting Hat", viewClass: AnyView(SortingHatView())),
        ChallengesCells(title: "8 - Pseudorandom", viewClass: AnyView(Pseudorandom())),
        ChallengesCells(title: "9 - Hete-Iso-Pag gram", viewClass: AnyView(Hete_Iso_PangramaView())),
        ChallengesCells(title: "10 - API", viewClass: AnyView(APIView())),
        ChallengesCells(title: "11 - URLParams", viewClass: AnyView(URLParamsView())),
        ChallengesCells(title: "12 - Friday 13", viewClass: AnyView(FridayThirteenView())),
        ChallengesCells(title: "13 - Guess the word", viewClass: AnyView(WordGuessView())),
        ChallengesCells(title: "14 - Decimal conversion", viewClass: AnyView(DecimalConversionView())),
        ChallengesCells(title: "15 - Aurebesh translator", viewClass: AnyView(AurebeshTranslatorView())),
        ChallengesCells(title: "16 - Ladders", viewClass: AnyView(LadderView())),
        ChallengesCells(title: "17 - Git commits", viewClass: AnyView(GitCommitsListView())),
        ChallengesCells(title: "18 - Web Scraping", viewClass: AnyView(WebScrapingView())),
        ChallengesCells(title: "19 - Text Analysis", viewClass: AnyView(TextAnalysisView())),
        ChallengesCells(title: "20 - Triforce", viewClass: AnyView(TriforceView())),
        ChallengesCells(title: "21 - Prime Twins Numbers", viewClass: AnyView(PrimeTwinsNumberView())),
        ChallengesCells(title: "22 - Spiral", viewClass: AnyView(SpiralView())),
        // TODO: 23 Data base
        ChallengesCells(title: "24 - Cesar Cypher", viewClass: AnyView(CesarCypherView())),
        ChallengesCells(title: "25 - Konami Code", viewClass: AnyView(KonamiCodeView())),
        ChallengesCells(title: "26 - Testing", viewClass: AnyView(TestingView())),
        ChallengesCells(title: "27 - Countdown", viewClass: AnyView(CountdownView())),
        ChallengesCells(title: "28 - Math expression", viewClass: AnyView(MathExpressionView())),
        ChallengesCells(title: "29 - Infiltrated Characters", viewClass: AnyView(InfiltratedCharacterView())),
        ChallengesCells(title: "30 - T9 Keyboard", viewClass: AnyView(T9KeyboardView())),
        ChallengesCells(title: "31 - Abacus", viewClass: AnyView(AbacusView())),
        ChallengesCells(title: "32 - Excel column number", viewClass: AnyView(ExcelColumnView())),
        ChallengesCells(title: "33 - Tetris", viewClass: AnyView(TetrisView())),
        ChallengesCells(title: "34 - TXT", viewClass: AnyView(TXTView())),
        ChallengesCells(title: "35 - First Steps", viewClass: AnyView(FirstStepsView())),
        ChallengesCells(title: "36 - Permutations", viewClass: AnyView(PermutationsView())),
        ChallengesCells(title: "37 - Color converter", viewClass: AnyView(ColorsView())),
        ChallengesCells(title: "38 - Adds", viewClass: AnyView(AddsView())),
        ChallengesCells(title: "39 - Pythagorean Triples", viewClass: AnyView(PythagoreanTriplesView())),
        ChallengesCells(title: "40 - Multiplication Tables", viewClass: AnyView(MultiplicationTablesView())),
        ChallengesCells(title: "41 - Haunted House", viewClass: AnyView(HauntedHouseView())),
        ChallengesCells(title: "42 - Meeting Point", viewClass: AnyView(MeetingPointView())),
        ChallengesCells(title: "43 - Weather Simulator", viewClass: AnyView(WeatherSimulatorView())),
        ChallengesCells(title: "44 - Math quiz", viewClass: AnyView(MathQuizView())),
        ChallengesCells(title: "45 - Advent calendar", viewClass: AnyView(AdventCalendarView())),
        ChallengesCells(title: "46 - Racing cars", viewClass: AnyView(RacingCarView())),
        ChallengesCells(title: "47 - Hundred points word", viewClass: AnyView(HundredPointWordView())),
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
