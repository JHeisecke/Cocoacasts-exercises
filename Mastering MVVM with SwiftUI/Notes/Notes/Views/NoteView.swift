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

    let presentable: NotePresentable

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading) {
            Text(presentable.title)
                .font(.title)
            Text(presentable.contents)
                .font(.body)
        }
    }

}

struct NoteView_Previews: PreviewProvider {

    private struct PreviewPresentable: NotePresentable {
        var title: String {
            "My Note"
        }
        
        var contents: String {
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        }
    }
    
    static var previews: some View {
        NoteView(presentable: PreviewPresentable()
        )
    }

}
