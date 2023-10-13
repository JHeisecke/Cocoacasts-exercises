//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-05.
//

import Foundation

@MainActor
final class LocationViewModel: ObservableObject {
    
    // MARK: - Types
    
    enum State {
        case fetching
        case data(
            currentConditionsViewModel: CurrentConditionsViewModel,
            forecastViewModel: ForecastViewModel
        )
        case error(message: String)
    }
    
    // MARK: - Properties
    private let weatherService: WeatherService
    private let location: Location
    
    var locationName: String {
        location.name
    }
    
    @Published private(set) var state: State = .fetching
    
    // MARK: - Initialization
    
    init(location: Location, weatherService: WeatherService) {
        self.location = location
        self.weatherService = weatherService
    }
    
    func start() async {
        do {
            let data = try await weatherService.weather(for: location)
            
            state = .data(
                currentConditionsViewModel: .init(currently: data.currently),
                forecastViewModel: .init(forecast: data.forecast)
            )
            
        } catch {
            state = .error(message: "Thunderstorm isn't able to display weather data for \(locationName). Please try again later.")
            print("Unable to fetch data for \(location) \(error)")
        }
    }
    
}
