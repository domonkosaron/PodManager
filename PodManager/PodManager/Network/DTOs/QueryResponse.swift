//
//  Welcome.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 11. 26..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Foundation

// MARK: - QueryResponse
struct QueryResponse: Codable {
    let hits: [Hit]
    let nbHits, page, nbPages, hitsPerPage: Int
    let exhaustiveNbHits: Bool
    let query: String
    let params: String
    let processingTimeMS: Int
}
