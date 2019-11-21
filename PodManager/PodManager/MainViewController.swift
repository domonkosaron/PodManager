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
    @IBOutlet weak var sideMenuView: NSView!
    @IBOutlet weak var sideMenuBottomView: NSView!
    @IBOutlet weak var gitHooksButton: NSButton!
    @IBOutlet weak var showInFinderButton: NSButton!
    @IBOutlet weak var terminalButton: NSButton!
    @IBOutlet weak var settingsButton: NSButton!
    @IBOutlet weak var separator1: NSView!
    @IBOutlet weak var myPodsButton: NSButton!
    @IBOutlet weak var popularButton: NSButton!
    @IBOutlet weak var favouritesButton: NSButton!
    @IBOutlet weak var templatesButton: NSButton!
    @IBOutlet weak var separator2: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        configureProjectNameTextField()
        configureSearchView()
        configureButtonsView()
        configureSideMenuView()
    }
    
    func configureProjectNameTextField() {
        projectNameView.customBackgroundColor = Colors.primaryColor
        projectNameTextField.drawsBackground = true
        projectNameTextField.backgroundColor = Colors.primaryColor
//        projectNameTextField.layer?.cornerRadius = 25
    }
    
    func configureSearchView() {
        searchView.customBackgroundColor = Colors.primaryColor
        searchBarView.customBackgroundColor = .labelColor
        searchBarView.layer?.cornerRadius = 18
        searchBarTextField.focusRingType = .none
        searchBarTextField.isBordered = false
        searchBarTextField.backgroundColor = .clear
    }
    
    func configureButtonsView() {
        buttonsView.customBackgroundColor = Colors.primaryColor
    }
    
    func configureSideMenuView() {
        sideMenuView.customBackgroundColor = Colors.secondaryColor
        separator1.customBackgroundColor = Colors.borderColor
        separator2.customBackgroundColor = Colors.borderColor
        
        let pstyle = NSMutableParagraphStyle()
        pstyle.alignment = .left
        let leftMenuBottomAttributes = [ NSAttributedString.Key.foregroundColor : Colors.flatGreenColor, NSAttributedString.Key.paragraphStyle : pstyle ]

        gitHooksButton.attributedTitle = NSAttributedString(string: "Git Hooks", attributes: leftMenuBottomAttributes)
        showInFinderButton.attributedTitle = NSAttributedString(string: "Show in Finder", attributes: leftMenuBottomAttributes)
        terminalButton.attributedTitle = NSAttributedString(string: "Terminal", attributes: leftMenuBottomAttributes)
        settingsButton.attributedTitle = NSAttributedString(string: "Settings", attributes: leftMenuBottomAttributes)
        
        let leftMenuTopAttributes = [ NSAttributedString.Key.foregroundColor : Colors.lightGray, NSAttributedString.Key.paragraphStyle : pstyle ]
        myPodsButton.attributedTitle = NSAttributedString(string: "MY PODS", attributes: leftMenuTopAttributes)
        popularButton.attributedTitle = NSAttributedString(string: "􀙭  POPULAR", attributes: leftMenuTopAttributes)
        favouritesButton.attributedTitle = NSAttributedString(string: "􀋃 FAVOURITES", attributes: leftMenuTopAttributes)
        templatesButton.attributedTitle = NSAttributedString(string: "􀉆  TEMPLATES", attributes: leftMenuTopAttributes)
    }
}
