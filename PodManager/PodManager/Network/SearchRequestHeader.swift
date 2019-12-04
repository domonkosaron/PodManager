//
//  SearchRequestHeader.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 12. 02..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Foundation

struct SearchRequestHeader: Codable {
    let apikey: String
    let apiid: String
    
    enum CodingKeys: String, CodingKey {
        case apikey = "X-Algolia-API-Key"
        case apiid = "X-Algolia-Application-Id"
    }
}
