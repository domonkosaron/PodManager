//
//  MainViewController.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 10. 17..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {

    @IBOutlet weak var projectNameTextField: NSTextField!
    @IBOutlet weak var searchBarTextField: NSTextField!
    @IBOutlet weak var searchButton: NSButton!
    @IBOutlet weak var moreButton: NSButton!
    @IBOutlet weak var updateButton: NSButton!
    @IBOutlet weak var installButton: NSButton!
    @IBOutlet weak var searchView: NSView!
    @IBOutlet weak var buttonsView: NSView!
    @IBOutlet weak var topBarView: NSView!
    
    var primaryColor = NSColor(calibratedRed: 69/255, green: 117/255, blue: 130/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        configureProjectNameTextField()
        configureSearchView()
        configureButtonsView()
    }
    
    func configureProjectNameTextField() {
        projectNameTextField.drawsBackground = true
        projectNameTextField.backgroundColor = primaryColor
    }
    
    func configureSearchView() {
        searchView.customBackgroundColor = primaryColor
    }
    
    func configureButtonsView() {
        buttonsView.customBackgroundColor = primaryColor
        
    }
}
