//
//  WeatherClient.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-13.
//

import Foundation

final class WeatherClient: WeatherService {
    
    private let baseURL: URL
    private let apiKey: String
    
    init(
        baseURL: URL = Configuration.clearSkyBaseUrl,
        apiKey: String = Configuration.clearSkyAPIKey
    ) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    
    func weather(for location: Location) async throws -> WeatherData {
        let queryItems: [URLQueryItem] = [
            .init(name: "lat", value: "\(location.latitude)"),
            .init(name: "long", value: "\(location.longitude)"),
            .init(name: "api_key", value: "tnperxfip8renk2hlzcccwetbnesby")
        ]
        
        let url = baseURL.appending(queryItems: queryItems)
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let result = try ClearSkyDecoder().decode(
            WeatherData.self,
            from: data
        )
        return result
    }
    
}
