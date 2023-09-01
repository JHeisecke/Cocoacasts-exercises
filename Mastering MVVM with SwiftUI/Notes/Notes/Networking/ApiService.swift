//
//  ApiService.swift
//  Notes
//
//  Created by Javier Heisecke on 2023-09-01.
//

import Foundation

protocol ApiService {
    func fetchNotes() async throws -> [Note]
}
