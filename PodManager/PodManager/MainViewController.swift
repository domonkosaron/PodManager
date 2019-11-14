//
//  MainViewController.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 10. 17..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {

    @IBOutlet weak var projectNameView: NSView!
    @IBOutlet weak var projectNameTextField: NSTextField!
    @IBOutlet weak var projectNameTextFieldCell: CustomNSTextFieldCell!
    @IBOutlet weak var searchBarTextField: NSTextField!
    @IBOutlet weak var searchButton: NSButton!
    @IBOutlet weak var moreButton: NSButton!
    @IBOutlet weak var updateButton: NSButton!
    @IBOutlet weak var installButton: NSButton!
    @IBOutlet weak var searchView: NSView!
    @IBOutlet weak var buttonsView: NSView!
    @IBOutlet weak var topBarView: NSView!
    @IBOutlet weak var searchBarView: NSView!
    
    var primaryColor = NSColor(calibratedRed: 69/255, green: 117/255, blue: 130/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        configureProjectNameTextField()
        configureSearchView()
        configureButtonsView()
    }
    
    func configureProjectNameTextField() {
        projectNameView.customBackgroundColor = primaryColor
        projectNameTextField.drawsBackground = true
        projectNameTextField.backgroundColor = primaryColor
//        projectNameTextField.layer?.cornerRadius = 25
    }
    
    func configureSearchView() {
        searchView.customBackgroundColor = primaryColor
        searchBarView.customBackgroundColor = .labelColor
        searchBarView.layer?.cornerRadius = 18
        searchBarTextField.focusRingType = .none
    }
    
    func configureButtonsView() {
        buttonsView.customBackgroundColor = primaryColor
    }
}
