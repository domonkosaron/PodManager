//
//  CustomNSTextFieldCell.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 10. 17..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Cocoa

class CustomNSTextFieldCell: NSTextFieldCell {
    override func drawingRect(forBounds theRect: NSRect) -> NSRect {
        let newRect = NSRect(x: 0, y: (theRect.size.height - 22) / 2, width: theRect.size.width, height: 22)
        return super.drawingRect(forBounds: newRect)
    }
}
