//
//  MockAnalyticsService.swift
//  NotesTests
//
//  Created by Javier Heisecke on 2023-04-05.
//

import Foundation
@testable import Notes

internal final class MockAnalyticsService: AnalyticsService {
    
    private(set) var events: [Journey.Event] = []
    
    func send(event: Notes.Journey.Event) {
        events.append(event)
    }
}
