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
        Journey.allCases.forEach { journey in
            let analyticsService = MockAnalyticsService()
            
            journey
                .properties()
                .send(to: analyticsService)
            
            let events = analyticsService.events
            XCTAssertEqual(events.count, 1)
            
            let name = events.first?.name
            switch journey {
            case .createNote:
                XCTAssertEqual(name, "create-note")
            case .deleteNote:
                XCTAssertEqual(name, "delete-note")
            case .updateNote:
                XCTAssertEqual(name, "update-note")
            case .duplicateNote:
                XCTAssertEqual(name, "duplicate-note")
            }
        }
    }

    func testPropertyKind() throws {
        let properties: [Journey.Property] = [
            .kind(.blank),
            .kind(.template("test"))
        ]
        
        properties.forEach { property in
            guard case .kind(let kind) = property else {
                XCTFail("Invalid Property")
                return
            }
            
            XCTAssertEqual(property.name, "kind")
            
            switch kind {
            case .blank:
                XCTAssertEqual(property.value as? String, "blank")
            case .template(let string):
                XCTAssertEqual(property.value as? String, "template \(string)")
            }
        }
    }
    
    func testPropertySource() throws {
        let properties: [Journey.Property] = Source.allCases.map { source in
            Journey.Property.source(source)
        }
        
        properties.forEach { property in
            guard case .source(let source) = property else {
                XCTFail("Invalid Property")
                return
            }
            
            XCTAssertEqual(property.name, "source")
            XCTAssertEqual(property.value as? String, source.rawValue)
        }
    }
    
    func testPropertyWordCount() throws {
        let wordCount = 123
        let property = Journey.Property.wordCount(wordCount)
        
        XCTAssertEqual(property.name, "wordCount")
        XCTAssertEqual(property.value as? Int, wordCount)
    }
}
