//
//  AddLocationViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-06.
//

import Foundation

internal final class AddLocationViewModel: ObservableObject {
    
    
    // MARK: - Properties

    @Published var query = ""
    @Published private(set) var locations: [Location] = Location.previews
    
    var textFieldPlaceholder: String {
        "Enter the name of a city..."
    }
    
    var addLocationCellViewModels: [AddLocationCellViewModel] {
        locations.map(AddLocationCellViewModel.init)
    }
    
    func addLocation(with id: String) {
        guard let locations = locations.first(where: { $0.id == id }) else { return }
        
        //TODO: ADD Location
    }
}
