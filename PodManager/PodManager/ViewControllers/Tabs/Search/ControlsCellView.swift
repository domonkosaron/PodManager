//
//  ControlsCellView.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 12. 04..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Foundation
import Cocoa

class ControlsCellView: NSTableCellView {
    var name: String = ""
    var hit : Hit? = nil
    var isFavourite = false
    var isAdded = false
    
    @IBOutlet weak var addButton: NSButton?
    @IBOutlet weak var favouriteButton: NSButton?
    
    
    override func awakeFromNib() {
    }
    
    func configure(hit: Hit) {
        self.name = hit.name
        self.hit = hit
        isFavourite = DataManager.shared.isFavourite(name: name)
        setStar()
    }
    
    func setStar() {
        if isFavourite {
            favouriteButton?.image = NSImage(named: "filled_star")
        } else {
            favouriteButton?.image = NSImage(named: "empty_star")
        }
    }
    
    @IBAction func favouriteButtonAction(_ sender: Any) {
        DataManager.shared.changeFavouriteState(hit: hit!)
        isFavourite = DataManager.shared.isFavourite(name: name)
        setStar()
    }
}
