//
//  CurrentConditionsViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import Foundation

struct CurrentConditionsViewModel {
    
    private let location: Location
    private let store: Store
    private let currently: WeatherData.CurrentConditions
    
    private let clearSkyFormatter = ClearSkyFormatter()
    
    // MARK: - Initialization
    
    init(
        currently: WeatherData.CurrentConditions,
        location: Location,
        store: Store
    ) {
        self.currently = currently
        self.location = location
        self.store = store
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
    
    func delete() {
        do {
            try store.removeLocation(location)
        } catch {
            print("Unable to Remove Location \(location)")
        }
    }
}
