//
//  WeatherService.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-13.
//

import Foundation

protocol WeatherService {
    
    func weather(for location: Location) async throws -> WeatherData
    
}
