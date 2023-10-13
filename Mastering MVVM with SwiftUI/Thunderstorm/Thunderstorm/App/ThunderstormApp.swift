//
//  ThunderstormApp.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-09-04.
//

import SwiftUI

@main
struct ThunderstormApp: App {
    var body: some Scene {
        WindowGroup {
            LocationsView(viewModel: .init(store: UserDefaults.standard))
        }
    }
}
