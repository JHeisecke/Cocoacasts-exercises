//
//  Journey.swift
//  Notes
//
//  Created by Javier Heisecke on 2023-03-02.
//

import Foundation

internal enum Journey {
    
    // MARK: - Cases
    case createNote
    case updateNote
    case deleteNote
    
    // MARK: - Properties
    
    private var event: String {
        switch self {
        case .createNote:
            return "create-note"
        case .updateNote:
            return "update-note"
        case .deleteNote:
            return "delete-note"
        }
    }
    
    // MARK: - Public API
    
    func properties(_ properties: [String: Any]) -> Event {
        Event(name: event, properties: properties)
    }
}


extension Journey {
    
    struct Event {
        
        // MARK: - Properties
        
        let name: String
        let properties: [String: Any]
        
        // MARK: - Properties
        
        func send(to analyticsService: GoogleAnalyticsClient = .shared) {
            analyticsService.trackEvent(with: name, properties: properties)
        }
    }
}


