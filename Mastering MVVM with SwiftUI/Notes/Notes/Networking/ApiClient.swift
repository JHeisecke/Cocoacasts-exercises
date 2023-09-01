//
//  ApiClient.swift
//  Notes
//
//  Created by Javier Heisecke on 2023-09-01.
//

import Foundation

final class ApiClient: ApiService {
    
    func fetchNotes() async throws -> [Note] {
        let url = URL(string: "https://cdn.cocoacasts.com/2354d51028d53fcc00ceb0c66f25475d5c79bff0/notes.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Note].self, from: data)
    }
}
