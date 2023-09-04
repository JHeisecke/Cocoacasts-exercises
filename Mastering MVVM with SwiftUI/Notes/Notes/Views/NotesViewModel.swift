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

    @Published private(set) var notesViewModel: [NoteViewModel] = []

    // MARK: - Initialization

    init(apiService: APIService) {
        self.apiService = apiService
    }

    // MARK: - Public API

    func start() {
        Task {
            do {
                notesViewModel = try await apiService.fetchNotes()
                    .map(NoteViewModel.init)
            } catch {
                print("Unable to Fetch Notes \(error)")
            }
        }
    }

}
