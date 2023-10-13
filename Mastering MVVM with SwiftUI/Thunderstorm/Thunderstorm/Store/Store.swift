//
//  Store.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-13.
//

import Combine

protocol Store {
    var locationsPublishers: AnyPublisher<[Location], Never> { get }
    
    func addLocation(_ location: Location) throws
    func removeLocation(_ location: Location) throws
    
}
