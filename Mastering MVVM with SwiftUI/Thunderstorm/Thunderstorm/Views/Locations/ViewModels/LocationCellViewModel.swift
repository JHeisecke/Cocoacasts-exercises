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
    
    /// Because we navigate from the cell to the location's view, we create the view model here
    var locationViewModel: LocationViewModel {
        .init(location: location)
    }
    
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
