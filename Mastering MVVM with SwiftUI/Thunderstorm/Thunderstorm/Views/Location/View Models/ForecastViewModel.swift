//
//  ForecastViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import Foundation

struct ForecastViewModel {
    
    var forecastCellViewModels: [ForecastCellViewModel] {
        (0..<10).map { _ in ForecastCellViewModel() }
    }
}
