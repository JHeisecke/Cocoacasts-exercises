//
//  APIPreviewClient.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Foundation

struct APIPreviewClient: APIService {

    func fetchNotes() async throws -> [Note] {
        guard let url = Bundle.main.url(forResource: "notes", withExtension: "json") else {
            fatalError("Unable to Find notes.json")
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Note].self, from: data)
    }

}
