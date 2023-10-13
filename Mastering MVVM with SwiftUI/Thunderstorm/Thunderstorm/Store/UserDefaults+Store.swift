//
//  UserDefaults+Store.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-13.
//

import Combine
import Foundation

extension UserDefaults: Store {
    
    /// We access the locations saved in the UserDefaults singleton by using the key defined previously
    /// We get rid of nil values using .compactMap
    /// We decode the value saved in UserDefaults to the type [Location]
    /// In case of error we publish an empty array
    var locationsPublishers: AnyPublisher<[Location], Never> {
        publisher(for: \.locations)
            .compactMap { $0 }
            .decode(type: [Location].self,
                    decoder: JSONDecoder()
            )
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
    
    
}

