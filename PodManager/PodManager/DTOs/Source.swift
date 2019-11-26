//
//  Source.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 11. 26..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Foundation

// MARK: - Source
struct Source: Codable {
    let git: String?
    let tag: String?
    let commit: String?
    let submodules: Bool? //Bool, ami nehol stringkent erkezik
    let http: String?
    let flatten: Bool?
    let sha1, type, sha256: String?
    let branch: String?
    let svn: String?
}
