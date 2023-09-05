//
//  ForecastViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import Foundation

struct ForecastViewModel {
    
    var forecastCellViewModels: [ForecastCellViewModel] {
        (0..<10).map { day in
            let increment = TimeInterval(day) * 24 * 3600
            let forecastDate = Date().addingTimeInterval(increment)
            return ForecastCellViewModel(forecastDate: forecastDate)
        }
    }
}
