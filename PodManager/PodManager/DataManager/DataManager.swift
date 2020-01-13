//
//  DataManager.swift
//  PodManager
//
//  Created by Domonkos Aron on 2020. 01. 13..
//  Copyright © 2020. Domonkos Aron. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private var favourites : [Hit] = []
    private var myPods : [Hit] = []
    
    func isFavourite(name: String) -> Bool {
        return favourites.contains(where: {$0.name == name})
    }
    
    func changeFavouriteState(hit: Hit) {
        if isFavourite(name: hit.name) {
            favourites.removeAll(where: {$0.name == hit.name})
        } else {
            favourites.append(hit)
        }
    }
}
