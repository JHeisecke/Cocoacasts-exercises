//
//  UserDefaults+Helper.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-13.
//

import Foundation

extension UserDefaults {
    
    private enum Keys {
        static let locations = "locations"
    }
    
    @objc var locations: Data? {
        get {
            data(forKey: Keys.locations)
        }
        set {
            set(newValue, forKey: Keys.locations)
        }
    }
}
