//
//  ClearSkyFormatter.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-13.
//

import Foundation

struct ClearSkyFormatter {
    
    // MARK: - Properties
    
    private let measurementFormatter = MeasurementFormatter()
    
    // MARK: - Initialization
    
    init(locale: Locale = .current) {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = locale
        numberFormatter.usesSignificantDigits = false
        measurementFormatter.locale = locale
        measurementFormatter.numberFormatter = numberFormatter
    }
    
    // MARK: - Public API
    
    func formatWindSpeed(_ windSpeed: Float) -> String {
        let measurement = Measurement(
            value: Double(windSpeed),
            unit: UnitSpeed.milesPerHour
        )
        
        return measurementFormatter.string(from: measurement)
    }
    
    func formatTemperature(_ temperature: Float) -> String {
        let measurement = Measurement(
            value: Double(temperature),
            unit: UnitTemperature.fahrenheit
        )
        
        return measurementFormatter.string(from: measurement)
    }
    
}
