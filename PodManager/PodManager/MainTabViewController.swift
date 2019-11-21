//
//  MainTabViewController.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 11. 21..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Cocoa

protocol TabChangeDelegate {
    func changeTo(tab: Int)
}

class MainTabViewController: NSTabViewController {

    var activeTab: Int = 0 {
        didSet {
            selectedTabViewItemIndex = activeTab
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do view setup here.
    }
    
}

extension MainTabViewController: TabChangeDelegate {
    func changeTo(tab: Int) {
        activeTab = tab
    }
}
