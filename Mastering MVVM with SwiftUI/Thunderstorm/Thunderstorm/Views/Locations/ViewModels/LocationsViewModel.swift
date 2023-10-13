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
    
    var title: String {
        "Thunderstorm"
    }
    
    var addLocationTitle: String {
        "Add Location"
    }
    
    @Published var locationCellViewModels: [LocationCellViewModel] = []
    
    var addLocationViewModel: AddLocationViewModel {
        AddLocationViewModel(geocodingService: GeocodingClient())
    }
    
    // MARK: - Methods
    
    func start() {
        /// We access the locations saved in the UserDefaults singleton by using the key defined previously
        /// We get rid of nil values using .compactMap
        /// We decode the value saved in UserDefaults to the type [Location]
        /// In case of error we publish an empty array
        /// We map the result of the result to the LocationCellViewModel class
        /// And assign the result to the locationCellViewModels array
        UserDefaults.standard.publisher(for: \.locations)
            .compactMap { $0 }
            .decode(type: [Location].self,
                    decoder: JSONDecoder()
            )
            .replaceError(with: [])
            .map { $0.map(LocationCellViewModel.init(location:)) }
            .eraseToAnyPublisher()
            .assign(to: &$locationCellViewModels)
    }
}
