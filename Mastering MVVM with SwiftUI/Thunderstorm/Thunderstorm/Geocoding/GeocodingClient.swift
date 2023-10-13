//
//  GeocodingClient.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-06.
//

import CoreLocation

final class GeocodingClient: GeocodingService {
    
    // MARK: - Types
    
    enum GeocodingError: Error {
        case invalidAddressString
        case requestFailed
    }
    
    // MARK: - Properties
    
    private let geocoder = CLGeocoder()
    
    // MARK: - Geocoding Service
    
    func geocodeAddressString(_ addressString: String) async throws -> [Location] {
        guard !addressString.isEmpty else {
            throw GeocodingError.invalidAddressString
        }
        
        do {
            return try await geocoder.geocodeAddressString(addressString)
                .compactMap { placemark in
                    return Location(placemark: placemark)
                }
        } catch {
            print("Unable to Geocode \(addressString) \(error)")
            throw GeocodingError.requestFailed
        }
    }
    
}
