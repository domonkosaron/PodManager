//
//  FavouritesViewController.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 11. 21..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Cocoa

class FavouritesViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    var favourites: [Hit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        favourites = DataManager.shared.favourites
        tableView.reloadData()
    }
    
    
}

extension FavouritesViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let currentHit = favourites[row]
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "nameColumn") {
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "nameCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NameCellView else { return nil }
            cellView.nameLabel?.stringValue = currentHit.name
            cellView.summaryLabel?.stringValue = currentHit.summary
            return cellView
        } else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "versionColumn") {
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "versionCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? VersionCellView else { return nil }
            cellView.versionPopUpButton?.removeAllItems()
            cellView.versionPopUpButton?.addItem(withTitle: currentHit.version)
            return cellView
        } else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "controlsColumn") {
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "controlsCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? ControlsCellView else { return nil }
            cellView.configure(hit: currentHit)
            return cellView
        } else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "statusColumn") {
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "statusCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? StatusCellView else { return nil }
            return cellView
        }
        return nil
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        73
    }
}

extension FavouritesViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        favourites.count
    }
}
