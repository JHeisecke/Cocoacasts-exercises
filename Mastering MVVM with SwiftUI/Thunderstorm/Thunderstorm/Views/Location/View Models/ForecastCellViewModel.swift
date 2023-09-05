//
//  ForecastCellView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import Foundation

struct ForecastCellViewModel: Identifiable {
    
    // MARK: - Properties
    
    private let forecastDate: Date
    
    private let dateFormatter = DateFormatter()
    
    var id: UUID {
        UUID()
    }
    
    var day: String {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: forecastDate).capitalized
    }
    
    var date: String {
        dateFormatter.dateFormat = "MM/dd"
        return dateFormatter.string(from: forecastDate).capitalized
    }
    
    var summary: String {
        "Clear"
    }
    
    var imageName: String {
        "sun.max"
    }
    
    var windSpeed: String {
        let windSpeed = Int.random(in: 0...30)
        return "\(windSpeed) mi/h"
    }
    
    var lowTemperature: String {
        let temperature = Int.random(in: 50...70)
        return "\(temperature) °F"
    }

    var highTemperature: String {
        let temperature = Int.random(in: 70...90)
        return "\(temperature) °F"
    }
    
    // MARK: - Initialization
    
    init(forecastDate: Date) {
        self.forecastDate = forecastDate
    }
}
