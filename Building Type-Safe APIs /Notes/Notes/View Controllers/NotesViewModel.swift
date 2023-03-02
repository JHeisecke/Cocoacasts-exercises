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
            .properties([
                "source": "home",
                "kind": "template"
            ]).send()
    }

    func updateNote(_ note: Note) {
        Journey.updateNote
            .properties([
                "source": "home",
                "kind": "template",
                "word_count": note.wordCount
            ]).send()
    }

    func deleteNote(_ note: Note) {
        Journey.deleteNote
            .properties([
                "kind": "template",
                "word_count": note.wordCount
            ]).send()
    }

}
