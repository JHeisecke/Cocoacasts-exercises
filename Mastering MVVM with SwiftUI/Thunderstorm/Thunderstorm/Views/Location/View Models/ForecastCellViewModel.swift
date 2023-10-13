//
//  ForecastCellView.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import Foundation

struct ForecastCellViewModel: Identifiable {
    
    // MARK: - Identifiable
    
    var id: UUID {
        UUID()
    }
    
    // MARK: - Properties
    
    private let dayConditions: WeatherData.DayConditions
    
    private let dateFormatter = DateFormatter()
    
    private let clearSkyFormatter = ClearSkyFormatter()
    
    var day: String {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: dayConditions.time).capitalized
    }
    
    var date: String {
        dateFormatter.dateFormat = "MM/dd"
        return dateFormatter.string(from: dayConditions.time).capitalized
    }
    
    var summary: String {
        dayConditions.summary
    }
    
    var imageName: String {
        switch dayConditions.icon {
        case "clear-day":
            return "sun.max"
        case "clear-night":
            return "moon"
        case "rain":
            return "cloud.rain"
        case "snow":
            return "cloud.snow"
        case "sleet":
            return "cloud.sleet"
        case "wind",
             "cloudy",
             "partly-cloudy-day",
             "partly-cloudy-night":
            return "cloud"
        default:
            return "sun.max"
        }
    }
    
    var windSpeed: String {
        clearSkyFormatter.formatWindSpeed(dayConditions.windSpeed)
    }
    
    var lowTemperature: String {
        clearSkyFormatter.formatTemperature(dayConditions.temperatureLow)
    }

    var highTemperature: String {
        clearSkyFormatter.formatTemperature(dayConditions.temperatureHigh)
    }
    
    // MARK: - Initialization
    
    init(dayConditions: WeatherData.DayConditions) {
        self.dayConditions = dayConditions
    }
}
