//
//  HighlightResult.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 11. 26..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Foundation

// MARK: - HighlightResult
struct HighlightResult: Codable {
    let name, summary: Name
    let authors: [HighlightResultAuthor]?
    let repoOwner: Name?
}
