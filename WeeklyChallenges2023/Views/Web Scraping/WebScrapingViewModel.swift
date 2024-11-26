//
//  WebScrapingViewModel.swift
//  WeeklyChallenges2023
//
//  Created by Guillermo Saavedra Dorantes  on 22/05/23.
//

import Foundation

final class WebScrapingViewModel: ObservableObject {
    
    private let service: ServiceLayer!
    @Published var schedules = [Schedule]()
    
    init(service: ServiceLayer! = ServiceLayer()) {
        self.service = service
        self.getSchedules()
    }
    
    private func getSchedules() {
        service.callAPI(url: "https://holamundo.day") {[weak self] json in
            let specificSchedule = json?.split(separator: "Agenda 8 de mayo | \\\"},").last?.split(separator: ",{\\\"type\\\":\\\"p\\\"").first?.replacingOccurrences(of: "\\", with: "").split(separator: "blockquote").dropFirst() ?? []
            var schedules = [Schedule]()
            for blockquote in specificSchedule {
                let cleanBlockquote = blockquote
                    .replacingOccurrences(of: "{", with: "")
                    .replacingOccurrences(of: "}", with: "")
                    .replacingOccurrences(of: "\"", with: "")
                    .replacingOccurrences(of: "children:[", with: "")
                    .replacingOccurrences(of: "text: ", with: "text:")
                    .split(separator: ",")
                    .filter({ $0.contains("text") && !$0.contains("|") && !$0.contains("\\") })
                    .compactMap({ "\($0)" })
                let onlyQuotes = cleanBlockquote.compactMap({ $0.replacingOccurrences(of: "text:", with: "") }).filter({ $0 != "" && $0 != "1"})
                schedules.append(Schedule(from: onlyQuotes))
            }
            
            DispatchQueue.main.async {
                self?.schedules = schedules
            }
        }
    }
}

struct Schedule: Codable, Identifiable {
    var id = UUID()
    let hour: String
    let name: String
    let speaker: String?
    
    init(from array: [String]) {
        if array.count == 3 {
            hour = array[0]
            name = array[1]
            speaker = array[2]
        } else {
            hour = array[0]
            name = array[1]
            speaker = nil
        }
    }
}
