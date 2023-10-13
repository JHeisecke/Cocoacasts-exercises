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
    private let weatherService: WeatherService
    
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
    
    init(
        store: Store,
        weatherService: WeatherService
    ) {
        self.store = store
        self.weatherService = weatherService
    }
    
    // MARK: - Methods
    
    func start() {
        let weatherService = self.weatherService
        /// We map the result of the result to the LocationCellViewModel class
        /// And assign the result to the locationCellViewModels array
        store.locationsPublishers
            .map { locations in
                locations.map { location in
                    LocationCellViewModel(location: location, weatherService: weatherService)
                }
            }
            .eraseToAnyPublisher()
            .assign(to: &$locationCellViewModels)
    }
}
