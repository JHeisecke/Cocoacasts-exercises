//
//  ForecastCellView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import Foundation

struct ForecastCellViewModel: Identifiable {
    
    // MARK: - Properties
    
    var id: UUID {
        UUID()
    }
    
    var temperature: String {
        let temperature = Int.random(in: 50...80)
        return "\(temperature) °F"
    }
}
