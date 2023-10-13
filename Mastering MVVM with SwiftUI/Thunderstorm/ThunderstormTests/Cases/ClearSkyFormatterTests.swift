//
//  ClearSkyFormatterTests.swift
//  ThunderstormTests
//
//  Created by Javier Heisecke on 2023-10-13.
//

import XCTest
@testable import Thunderstorm

final class ClearSkyFormatterTests: XCTestCase {

    func testFormatWindSpeed() throws {
        let locale = Locale(identifier: "es_PY")
        let formatter = ClearSkyFormatter(locale: locale)
        
        XCTAssertEqual(
            formatter.formatWindSpeed(12.35),
            "20 km/h"
        )
    }
    
    func testFormatTemperature() throws {
        let locale = Locale(identifier: "es_PY")
        let formatter = ClearSkyFormatter(locale: locale)
        
        XCTAssertEqual(
            formatter.formatTemperature(32.0),
            "0 °C"
        )
    }
}
