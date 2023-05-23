//
//  WebScrapingView.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 22/05/23.
//

import SwiftUI

struct WebScrapingView: View {
    
    @StateObject private var viewModel = WebScrapingViewModel()
    
    var body: some View {
        ZStack {
            List(viewModel.schedules) { schedule in
                VStack(alignment: .leading) {
                    Text(schedule.hour)
                        .font(.largeTitle)
                        .bold()
                    Text(schedule.name)
                        .font(.title3)
                        .italic()
                    Text(schedule.speaker ?? "")
                        .font(.system(size: 12))
                }
            }.navigationBarTitle("HolaMundo day 8")
            ProgressView()
                .opacity(viewModel.schedules.isEmpty ? 1 : 0)
        }
    }
}

struct WebScrapingView_Previews: PreviewProvider {
    static var previews: some View {
        WebScrapingView()
    }
}
