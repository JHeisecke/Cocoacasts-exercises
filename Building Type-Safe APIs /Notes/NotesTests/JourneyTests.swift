//
//  JourneyTests.swift
//  NotesTests
//
//  Created by Javier Heisecke on 2023-04-05.
//

import XCTest
@testable import Notes

final class JourneyTests: XCTestCase {

    func testEventNames() throws {
        let analyticsService = MockAnalyticsService()
        
        Journey.createNote
            .properties()
            .send(to: analyticsService)
        
        let events = analyticsService.events
        
        XCTAssertEqual(events.count, 1)
        XCTAssertEqual(events.first?.name, "create-note")
    }

}
