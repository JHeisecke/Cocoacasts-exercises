//
//  AppDelegate.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import UIKit
import Swinject

@main
internal final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Application Life Cycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupDependencies()

        return true
    }

    // MARK: Scene Session Life Cycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }

    // MARK: - Helper Methods

    private func setupDependencies() {
        Container.shared.register(AnalyticsService.self) { _ in
            GoogleAnalyticsService()
        }
    }

}
