//
//  AddLocationViewModel.swift
//  Thunderstorm
//
//  Created by Javier Heisecke on 2023-10-06.
//

import Foundation

internal final class AddLocationViewModel: ObservableObject {
    
    @Published var query = ""
    
    // MARK: - Properties
    
    var textFieldPlaceholder: String {
        "Enter the name of a city..."
    }
}
