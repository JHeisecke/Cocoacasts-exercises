//
//  ForecastViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import Foundation

struct ForecastViewModel {
    
    private let forecast: [WeatherData.DayConditions]
    
    var forecastCellViewModels: [ForecastCellViewModel] {
        forecast.map(ForecastCellViewModel.init)
    }
    
    init(forecast: [WeatherData.DayConditions]) {
        self.forecast = forecast
    }
}
