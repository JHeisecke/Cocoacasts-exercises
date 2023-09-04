//
//  LocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-04.
//

import Foundation

struct LocationCellViewModel: Identifiable {
    
    // MARK: - Properties
    
    private let location: Location
    
    // MARK: - Identifiable
    
    var id: String {
        location.id
    }
    
    // MARK: - Initialization
    
    init(location: Location) {
        self.location = location
    }
    
    // MARK: - Public API
    
    var locationName: String {
        location.name
    }
    
    var locationCountry: String {
        location.country
    }
    
    var summary: String? {
        "Clear"
    }
    
    var windSpeed: String? {
        "10 mi/h"
    }
    
    var temperaute: String? {
        "90 °F"
    }
}
