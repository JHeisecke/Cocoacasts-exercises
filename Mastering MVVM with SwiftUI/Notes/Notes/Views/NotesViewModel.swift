//
//  NotesViewModel.swift
//  Notes
//
//  Created by Javier Heisecke on 2023-08-30.
//

import Foundation


/// we need to publish changes from the main thread, therefore, the class gets a modifier @MainActor to publish changes in the main thread
/// The reason behind this is because UI changes should always be published in the main thread
@MainActor final class NotesViewModel: ObservableObject {
    
    // MARK: - Properties

    private let apiService: ApiService
    
    @Published private(set) var notes: [Note] = []
    
    // MARK: - Initialization
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }

    // MARK: - Helper Methods
    
    func start() {
        Task {
            do {
                notes = try await apiService.fetchNotes()
            } catch {
                print("Unable to Fetch Notes \(error)")
            }
        }
    }
    
}
