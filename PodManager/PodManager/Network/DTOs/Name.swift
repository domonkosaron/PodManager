//
//  Name.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 11. 26..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Foundation

// MARK: - Name
struct Name: Codable {
    let value: String
    let matchLevel: MatchLevel
    let fullyHighlighted: Bool?
    let matchedWords: [String]?
}
