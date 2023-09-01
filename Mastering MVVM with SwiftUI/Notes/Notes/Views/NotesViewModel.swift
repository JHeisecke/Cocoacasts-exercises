//
//  NotesViewModel.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Foundation

@MainActor final class NotesViewModel: ObservableObject {

    // MARK: - Properties

    private let apiService: APIService

    @Published private(set) var notes: [Note] = []

    // MARK: - Initialization

    init(apiService: APIService) {
        self.apiService = apiService
    }

    // MARK: - Public API

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
