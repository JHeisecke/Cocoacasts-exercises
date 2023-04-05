//
//  GoogleAnalyticsClient+AnalyticsService.swift
//  Notes
//
//  Created by Javier Heisecke on 2023-04-05.
//

import Foundation

extension GoogleAnalyticsClient: AnalyticsService {
    
    func send(event: Journey.Event) {
        var properties: [String: Any] = [:]
        event.properties.forEach { property in
            properties[property.name] = property.value
        }
        trackEvent(with: event.name, properties: properties)
    }
}
