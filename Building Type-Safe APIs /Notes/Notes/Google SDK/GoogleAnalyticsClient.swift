//
//  GoogleAnalyticsClient.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Foundation

internal final class GoogleAnalyticsClient {
        
    // MARK: - Properties

    private let apiKey: String
    private let clientSecret: String

    // MARK: - Initialization

    init(apiKey: String, clientSecret: String) {
        self.apiKey = apiKey
        self.clientSecret = clientSecret
    }

    // MARK: - Public API

    func trackEvent(with name: String, properties: [String: Any]) {
        // Private Implementation
    }

}
