//
//  LocationsViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-04.
//

import Foundation
import Combine

@MainActor
final class LocationsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    private let store: Store
    
    var title: String {
        "Thunderstorm"
    }
    
    var addLocationTitle: String {
        "Add Location"
    }
    
    @Published var locationCellViewModels: [LocationCellViewModel] = []
    
    var addLocationViewModel: AddLocationViewModel {
        AddLocationViewModel(
            store: store,
            geocodingService: GeocodingClient()
        )
    }
    
    // MARK: - Initialization
    
    init(store: Store) {
        self.store = store
    }
    
    // MARK: - Methods
    
    func start() {
        /// We map the result of the result to the LocationCellViewModel class
        /// And assign the result to the locationCellViewModels array
        store.locationsPublishers
            .map { $0.map(LocationCellViewModel.init(location:)) }
            .eraseToAnyPublisher()
            .assign(to: &$locationCellViewModels)
    }
}
