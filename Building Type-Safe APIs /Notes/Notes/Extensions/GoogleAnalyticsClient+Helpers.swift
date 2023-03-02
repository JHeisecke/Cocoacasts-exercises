//
//  GoogleAnalyticsClient+Helpers.swift
//  Notes
//
//  Created by Javier Heisecke on 2023-03-02.
//

import Foundation

extension GoogleAnalyticsClient {

    static let shared = GoogleAnalyticsClient(
        apiKey: Configuration.Google.apiKey,
        clientSecret: Configuration.Google.clientSecret
    )

}
