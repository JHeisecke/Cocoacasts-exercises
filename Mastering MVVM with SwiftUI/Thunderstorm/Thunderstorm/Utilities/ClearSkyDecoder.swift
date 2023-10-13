//
//  ClearSkyDecoder.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-13.
//

import Foundation

final class ClearSkyDecoder: JSONDecoder {
    
    override init() {
        super.init()
        
        dateDecodingStrategy = .secondsSince1970
    }
    
}
