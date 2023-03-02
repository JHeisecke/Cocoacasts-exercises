//
//  AnalyticsService.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Foundation

protocol AnalyticsService {

    func send(event: String, properties: [String: Any])

}
