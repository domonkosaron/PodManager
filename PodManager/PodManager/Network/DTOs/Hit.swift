//
//  Hit.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 11. 26..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Foundation

// MARK: - Hit
struct Hit: Codable {
    let name, version, summary: String
    let homepage: String?
    let license: String?
    let authors: [HitAuthor]?
    let platforms: Platforms?
    let source: Source?
    let swiftVersion: String?
    let dependencies: [String]?
    let downloads: Downloads
    let repoOwner : String?
    let objectID: String
    let highlightResult: HighlightResult

    enum CodingKeys: String, CodingKey {
        case name, version, summary, homepage, license, authors, platforms, source
        case swiftVersion = "swift_version"
        case dependencies, downloads, repoOwner, objectID
        case highlightResult = "_highlightResult"
    }
}
