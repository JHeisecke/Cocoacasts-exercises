//
//  NoteView.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import SwiftUI

struct NoteView: View {

    // MARK: - Properties

    let title: String
    let contents: String

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
            Text(contents)
                .font(.body)
        }
    }

}

struct NoteView_Previews: PreviewProvider {

    static var previews: some View {
        NoteView(
            title: "My Note",
            contents: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        )
    }

}
