//
//  MainViewController.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 10. 17..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController, NSTextFieldDelegate {

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
    @IBOutlet weak var tabView: NSView!
    
    var tabChangeDelegate: TabChangeDelegate?
    var searchResultDelegate: SearchResultDelegate?
    
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
        searchBarTextField.textColor = .black
        
        searchBarTextField.delegate = self
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
        let leftMenuTopHighlightedAttributes = [ NSAttributedString.Key.foregroundColor : Colors.flatGreenColor, NSAttributedString.Key.paragraphStyle : pstyle ]
        myPodsButton.attributedTitle = NSAttributedString(string: "MY PODS 􀘙", attributes: leftMenuTopHighlightedAttributes)
        popularButton.attributedTitle = NSAttributedString(string: "􀙭  POPULAR", attributes: leftMenuTopAttributes)
        favouritesButton.attributedTitle = NSAttributedString(string: "􀋃 FAVOURITES", attributes: leftMenuTopAttributes)
        templatesButton.attributedTitle = NSAttributedString(string: "􀉆  TEMPLATES", attributes: leftMenuTopAttributes)
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if let viewController = segue.destinationController as? MainTabViewController {
            tabChangeDelegate = viewController
        }
        
        if let viewController = segue.destinationController as? SearchViewController {
            print()
        }
    }
    @IBAction func myPodsButtonTouchUpInside(_ sender: Any) {
        setActive(tab: 0)
    }
    @IBAction func popularButtonTouchUpInside(_ sender: Any) {
        setActive(tab: 1)
    }
    @IBAction func favouritesButtonTouchUpInside(_ sender: Any) {
        setActive(tab: 2)
    }
    @IBAction func templatesButtonTouchUpInside(_ sender: Any) {
        setActive(tab: 3)
    }
    
    @IBAction func searchButtonTouchUpInside(_ sender: Any) {
        setActive(tab: 4)
    }
    
    func setActive(tab: Int) {
        tabChangeDelegate?.changeTo(tab: tab)
        
        let pstyle = NSMutableParagraphStyle()
        pstyle.alignment = .left
        let leftMenuTopAttributes = [ NSAttributedString.Key.foregroundColor : Colors.lightGray, NSAttributedString.Key.paragraphStyle : pstyle ]
        let leftMenuTopHighlightedAttributes = [ NSAttributedString.Key.foregroundColor : Colors.flatGreenColor, NSAttributedString.Key.paragraphStyle : pstyle ]
        myPodsButton.attributedTitle = NSAttributedString(string: "MY PODS 􀘙", attributes: leftMenuTopAttributes)
        popularButton.attributedTitle = NSAttributedString(string: "􀙭  POPULAR", attributes: leftMenuTopAttributes)
        favouritesButton.attributedTitle = NSAttributedString(string: "􀋃 FAVOURITES", attributes: leftMenuTopAttributes)
        templatesButton.attributedTitle = NSAttributedString(string: "􀉆  TEMPLATES", attributes: leftMenuTopAttributes)
        switch tab {
        case 0:
            myPodsButton.attributedTitle = NSAttributedString(string: "MY PODS 􀘙", attributes: leftMenuTopHighlightedAttributes)
        case 1:
            popularButton.attributedTitle = NSAttributedString(string: "􀙭  POPULAR", attributes: leftMenuTopHighlightedAttributes)
        case 2:
            favouritesButton.attributedTitle = NSAttributedString(string: "􀋃 FAVOURITES", attributes: leftMenuTopHighlightedAttributes)
        case 3:
            templatesButton.attributedTitle = NSAttributedString(string: "􀉆  TEMPLATES", attributes: leftMenuTopHighlightedAttributes)
        default:
            break
        }
    }
    
    func controlTextDidChange(_ obj: Notification) {
//        print("--- Text: ", searchBarTextField.stringValue)
        SearchAPI.shared.search(for: searchBarTextField.stringValue) { [weak self] result in
            switch result {
            case .success(let response):
                self?.setActive(tab: 4)
                NotificationCenter.default.post(name: .searchResult,
                object: response)
            case .failure:
                print()
            }
        }
    }
}
