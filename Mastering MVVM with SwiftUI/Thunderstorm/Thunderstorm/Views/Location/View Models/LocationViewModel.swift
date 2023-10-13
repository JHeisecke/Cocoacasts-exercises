//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import Foundation

struct LocationViewModel {
    
    // MARK: - Properties
    
    private let location: Location
    
    var locationName: String {
        location.name
    }
    
    var currentConditionsViewModel: CurrentConditionsViewModel {
        .init(currently: WeatherData.preview.currently)
    }
    
    var forecastViewModel: ForecastViewModel {
        .init(forecast: WeatherData.preview.forecast)
    }
    
    // MARK: - Initialization
    
    init(location: Location) {
        self.location = location
    }
    
}
