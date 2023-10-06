//
//  LocationsViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-04.
//

import Foundation

struct LocationsViewModel {
    
    var title: String {
        "Thunderstorm"
    }
    
    var locationCellViewModels: [LocationCellViewModel] {
        Location.previews.map(LocationCellViewModel.init)
    }
    
    var addLocationTitle: String {
        "Add Location"
    }
}
