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
    
    func properties(_ properties: Property...) -> Event {
        Event(name: event, properties: properties)
    }
}


extension Journey {
    
    struct Event {
        
        // MARK: - Properties
        
        let name: String
        let properties: [Property]
        
        // MARK: - Properties
        
        func send(to analyticsService: GoogleAnalyticsClient = .shared) {
            var properties: [String: Any] = [:]
            self.properties.forEach { property in
                properties[property.name] = property.value
            }
            analyticsService.trackEvent(with: name, properties: properties)
        }
    }
    
    enum Property {
        
        //MARK: - Cases
        
        case kind(Kind)
        case source(Source)
        case wordCount(Int)
        
        var name: String {
            switch self {
            case .kind: return "kind"
            case .source: return "source"
            case .wordCount: return "wordCount"
            }
        }
        
        var value: Any {
            switch self {
            case .kind(let kind): return kind.rawValue
            case .source(let source): return source.rawValue
            case .wordCount(let wordCount): return wordCount
            }
        }
    }
}


