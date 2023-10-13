//
//  Geocoder.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-13.
//

import CoreLocation

protocol Geocoder {
    
    func geocodeAddressString(_ addressString: String) async throws -> [CLPlacemark]
}
