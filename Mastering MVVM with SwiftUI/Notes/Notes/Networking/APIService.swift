//
//  APIService.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Foundation

protocol APIService {

    // MARK: - Methods

    func fetchNotes() async throws -> [Note]

}
