//
//  NotesViewModel.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Foundation

internal final class NotesViewModel {
    
    // MARK: - Public API

    func createNote(_ note: Note) {
        Journey.createNote
            .properties(
                .kind(note.kind),
                .source(.home)
            ).send()
    }

    func updateNote(_ note: Note) {
        Journey.updateNote
            .properties(
                .kind(note.kind),
                .source(.home),
                .wordCount(note.wordCount)
            ).send()
    }

    func deleteNote(_ note: Note) {
        Journey.deleteNote
            .properties(
                .kind(note.kind),
                .wordCount(note.wordCount)
            ).send()
    }

}
