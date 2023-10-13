//
//  AddLocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-06.
//

import Foundation

struct AddLocationCellViewModel: Identifiable, Equatable {
    
    // MARK: - Properties
    
    private let location: Location
    
    // MARK: - Initialization
    
    init(location: Location) {
        self.location = location
    }
    
    // MARK: - Public API
    
    var id: String {
        location.id
    }
    
    var name: String {
        location.name
    }
    
    var country: String {
        location.country
    }
    
    var coordinates: String {
        "\(location.latitude) \(location.longitude)"
    }
}
