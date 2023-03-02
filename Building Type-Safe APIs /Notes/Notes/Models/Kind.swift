//
//  Kind.swift
//  Notes
//
//  Created by Javier Heisecke on 2023-03-02.
//

import Foundation

enum Kind {
    // MARK: - Cases
    
    case blank
    case template(String)
    
    // MARK: - Properties
    
    var rawValue: String {
        switch self {
        case .blank:
            return "blank"
        case .template(let string):
            return "template \(string)"
        }
    }
}
