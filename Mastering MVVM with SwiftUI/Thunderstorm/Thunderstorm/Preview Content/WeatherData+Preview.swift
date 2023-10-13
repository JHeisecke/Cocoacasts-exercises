//
//  WeatherData+Preview.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-13.
//

import Foundation

extension WeatherData {
    
    static var preview: Self {
        let url = Bundle.main.url(
            forResource: "clearsky",
            withExtension: "json"
        )!
        
        let data = try! Data(contentsOf: url)
        
        return try! ClearSkyDecoder().decode(
            WeatherData.self,
            from: data
        )
    }
    
}
