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
    
    var currentConditionsViewModel: CurrentConditionsViewModel {
        .init()
    }
    
    var forecastViewModel: ForecastViewModel {
        .init()
    }
    
    // MARK: - Initialization
    
    init(location: Location) {
        self.location = location
    }
}
