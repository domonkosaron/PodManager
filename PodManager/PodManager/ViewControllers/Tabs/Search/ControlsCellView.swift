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
    var hit : Hit? = nil
    var isFavourite = false
    var isAdded = false
    
    @IBOutlet weak var addButton: NSButton?
    @IBOutlet weak var favouriteButton: NSButton?
    
    
    override func awakeFromNib() {
    }
    
    func configure(hit: Hit) {
        self.hit = hit
        update()
    }
    
    func update() {
        isFavourite = DataManager.shared.isFavourite(name: hit!.name)
        isAdded = DataManager.shared.isMyPod(name: hit!.name)
        
        if isFavourite {
            favouriteButton?.image = NSImage(named: "filled_star")
        } else {
            favouriteButton?.image = NSImage(named: "empty_star")
        }
        
        if isAdded {
            addButton?.image = NSImage(named: "added")
        } else {
            addButton?.image = NSImage(named: "plus")
        }
    }
    
    @IBAction func favouriteButtonAction(_ sender: Any) {
        DataManager.shared.changeFavouriteState(hit: hit!)
        update()
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        DataManager.shared.changeMyPodState(hit: hit!)
        update()
    }
}
