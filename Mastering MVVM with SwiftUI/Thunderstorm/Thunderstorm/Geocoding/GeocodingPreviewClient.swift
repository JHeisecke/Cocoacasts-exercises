//
//  GeocodingPreviewClient.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-06.
//

import Foundation

struct GeocodingPreviewClient: GeocodingService {
    
    func geocodeAddressString(_ addressString: String) async throws -> [Location] {
        Location.previews
    }
}
