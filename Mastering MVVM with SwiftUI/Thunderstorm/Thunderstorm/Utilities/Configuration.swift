//
//  Configuration.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-13.
//

import Foundation

enum Configuration {
    
    private enum Keys {
        static let clearSkyBaseUrl = "CLEAR_SKY_BASE_URL"
        static let clearSkyAPIKey = "CLEAR_SKY_API_KEY"
    }
    
    private static var infoDictionary: [String: Any] {
        Bundle.main.infoDictionary ?? [:]
    }
    
    static var clearSkyBaseUrl: URL {
        let urlAsString = infoDictionary[Keys.clearSkyBaseUrl] as! String
        return URL(string: urlAsString)!
    }
    
    static var clearSkyAPIKey: String {
        infoDictionary[Keys.clearSkyAPIKey] as! String
    }
}
