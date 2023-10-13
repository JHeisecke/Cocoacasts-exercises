//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import Foundation

@MainActor
final class LocationViewModel: ObservableObject {
    
    // MARK: - Properties
    private let weatherService: WeatherService
    private let location: Location
    
    var locationName: String {
        location.name
    }
    
    @Published private(set) var currentConditionsViewModel: CurrentConditionsViewModel?
    
    @Published private(set) var forecastViewModel: ForecastViewModel?
    
    // MARK: - Initialization
    
    init(location: Location, weatherService: WeatherService) {
        self.location = location
        self.weatherService = weatherService
    }
    
    func start() async {
        do {
            let data = try await weatherService.weather(for: location)
            
            currentConditionsViewModel = .init(currently: data.currently)
            forecastViewModel = .init(forecast: data.forecast)
            
        } catch {
            print("Unable to fetch data for \(location) \(error)")
        }
    }
    
}
