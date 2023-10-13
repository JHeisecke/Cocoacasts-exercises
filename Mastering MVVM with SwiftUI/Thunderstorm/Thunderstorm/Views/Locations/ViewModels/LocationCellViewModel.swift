//
//  LocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-04.
//

import Foundation

@MainActor
final class LocationCellViewModel: Identifiable, ObservableObject {
    
    // MARK: - Properties
    
    private let location: Location
    private let weatherService: WeatherService
    
    @Published private var weatherData: WeatherData?
    
    /// Because we navigate from the cell to the location's view, we create the view model here
    var locationViewModel: LocationViewModel {
        .init(location: location)
    }
    
    private let measurementFormater: MeasurementFormatter = {
       let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = false
        
        let measurementFormater = MeasurementFormatter()
        measurementFormater.numberFormatter = numberFormatter
        return measurementFormater
    }()
    
    // MARK: - Initialization
    
    init(
        location: Location,
        weatherService: WeatherService
    ) {
        self.location = location
        self.weatherService = weatherService
    }
    
    // MARK: - Public API
    
    var locationName: String {
        location.name
    }
    
    var locationCountry: String {
        location.country
    }
    
    var summary: String? {
        weatherData?.currently.summary
    }
    
    var windSpeed: String? {
        guard let windSpeed = weatherData?.currently.windSpeed else {
            return nil
        }
        
        let measurement = Measurement(
            value: Double(windSpeed),
            unit: UnitSpeed.milesPerHour
        )
        
        return measurementFormater.string(from: measurement)
    }
    
    var temperaute: String? {
        guard let windSpeed = weatherData?.currently.temperature else {
            return nil
        }
        
        let measurement = Measurement(
            value: Double(windSpeed),
            unit: UnitTemperature.fahrenheit
        )
        
        return measurementFormater.string(from: measurement)
    }
    
    func start() async {
        do {
            weatherData = try await weatherService.weather(for: location)
        } catch {
            print("unable to Fetch Weather Data for Location \(error)")
        }
    }
}
