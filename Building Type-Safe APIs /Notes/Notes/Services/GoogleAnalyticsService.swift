//
//  GoogleAnalyticsService.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Foundation

internal final class GoogleAnalyticsService: AnalyticsService {

    // MARK: - Type Properties

    static let shared = GoogleAnalyticsService()

    // MARK: - Properties

    private let client: GoogleAnalyticsClient

    // MARK: - Initialization

    init() {
        self.client = .init(
            apiKey: Configuration.Google.apiKey,
            clientSecret: Configuration.Google.clientSecret
        )
    }

    // MARK: - Analytics Service
    
    func send(event: String, properties: [String: Any]) {
        client.trackEvent(with: event, properties: properties)
    }

}
