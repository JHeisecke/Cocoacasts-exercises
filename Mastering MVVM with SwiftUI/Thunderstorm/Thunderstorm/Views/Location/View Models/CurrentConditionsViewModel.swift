//
//  CurrentConditionsViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import Foundation

struct CurrentConditionsViewModel {
    
    private let currently: WeatherData.CurrentConditions
    
    private let clearSkyFormatter = ClearSkyFormatter()
    
    // MARK: - Initialization
    
    init(currently: WeatherData.CurrentConditions) {
        self.currently = currently
    }
    
    // MARK: - Public APIs
    
    var summary: String {
        currently.summary
    }

    var windSpeed: String {
        clearSkyFormatter.formatWindSpeed(currently.windSpeed)
    }

    var temperature: String {
        clearSkyFormatter.formatTemperature(currently.temperature)
    }
}
