//
//  PreviewsStore.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-13.
//

import Foundation
import Combine

final class PreviewsStore: Store {
    
    @Published private var locations = Location.previews
    
    var locationsPublishers: AnyPublisher<[Location], Never> {
        $locations
            .eraseToAnyPublisher()
    }
    
    func addLocation(_ location: Location) throws {
        locations.append(location)
    }
    
    func removeLocation(_ location: Location) throws {
        locations.removeAll { $0.id == location.id }
    }
    
}
