//
//  SceneDelegate.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import UIKit

internal final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Properties

    var window: UIWindow?

    // MARK: - Scene Life Cycle

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        let window = UIWindow(windowScene: windowScene)

        window.rootViewController = UIStoryboard.main.instantiateInitialViewController { coder in
            NotesViewController(coder: coder, viewModel: .init())
        }

        window.makeKeyAndVisible()
        
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }

}

fileprivate extension UIStoryboard {

    static var main: UIStoryboard {
        UIStoryboard(name: "Main", bundle: .main)
    }

}
