//
//  Note.swift
//  Notes
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Foundation

struct Note: Decodable, Identifiable {

    // MARK: - Properties

    let id: Int
    let title: String
    let contents: String
    
}
