//
//  Note.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Foundation

internal struct Note {

    // MARK: - Properties

    let title: String
    let body: String
    let kind: String

    // MARK: -

    var wordCount: Int {
        body.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .count
    }

}

extension Note {

    static var example: Self {
        .init(
            title: "Morbi volutpat risus eget turpis fringilla ultricies.",
            body: "In hac habitasse platea dictumst. Pellentesque molestie ipsum blandit odio ultrices viverra. Phasellus imperdiet et est a sollicitudin.",
            kind: "blank"
        )
    }

}
