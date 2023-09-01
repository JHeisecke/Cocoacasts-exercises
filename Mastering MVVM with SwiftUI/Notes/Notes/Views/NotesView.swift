//
//  NotesView.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import SwiftUI

struct NotesView: View {

    // MARK: - Properties

    @ObservedObject var viewModel: NotesViewModel

    // MARK: - View

    var body: some View {
        NavigationView {
            List(viewModel.notes) { note in
                NoteView(
                    title: note.title,
                    contents: note.contents
                )
            }
            .navigationTitle("Notes")
        }
        .onAppear {
            viewModel.start()
        }
    }

}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView(
            viewModel: .init(
                apiService: APIPreviewClient()
            )
        )
    }
}
