//
//  Container+Helpers.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Swinject

extension Container {

    // MARK: - Properties

    static let shared = Container()

    // MARK: - Services

    static var analyticsService: AnalyticsService {
        shared.resolve(AnalyticsService.self)!
    }

}
