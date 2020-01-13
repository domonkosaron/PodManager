//
//  SearchViewController.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 12. 02..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Cocoa

protocol SearchResultDelegate {
    func show(for response: QueryResponse)
}

class SearchViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    
    var query: QueryResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector:#selector(showSearch(_:)), name: .searchResult, object: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    deinit {
    NotificationCenter.default.removeObserver(self, name: .searchResult, object: nil) }
}

extension SearchViewController {
    @objc func showSearch(_ notification: Notification) {
        if let searchResult = notification.object as? QueryResponse {
//            print("--- searchResult: ", searchResult.hits.first?.name)
            query = searchResult
            tableView.reloadData()
        }
    }
}

extension SearchViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let currentHit = query?.hits[row]
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "nameColumn") {
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "nameCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NameCellView else { return nil }
            cellView.nameLabel?.stringValue = currentHit?.name ?? "no name"
            cellView.summaryLabel?.stringValue = currentHit?.summary ?? "no summary"
            return cellView
        } else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "versionColumn") {
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "versionCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? VersionCellView else { return nil }
            cellView.versionPopUpButton?.removeAllItems()
            cellView.versionPopUpButton?.addItem(withTitle: currentHit?.version ?? "no version")
            cellView.versionPopUpButton?.addItem(withTitle: "1.2.3")
            cellView.versionPopUpButton?.addItem(withTitle: "3.4.5")
            return cellView
        } else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "controlsColumn") {
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "controlsCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? ControlsCellView else { return nil }
            cellView.configure(hit: currentHit!)
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

extension SearchViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        query?.hits.count ?? 0
    }
}
