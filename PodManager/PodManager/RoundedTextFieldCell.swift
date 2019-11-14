//
//  RoundedTextFieldCell.swift
//  PodManager
//
//  Created by Domonkos Aron on 2019. 11. 14..
//  Copyright © 2019. Domonkos Aron. All rights reserved.
//

import Foundation
import AppKit

class RoundedTextFieldCell: NSTextFieldCell {

    @IBInspectable var borderColor: NSColor = .clear
    @IBInspectable var cornerRadius: CGFloat = 3

    override func draw(withFrame cellFrame: NSRect, in controlView: NSView) {
        let bounds = NSBezierPath(roundedRect: cellFrame, xRadius: cornerRadius, yRadius: cornerRadius)
        bounds.addClip()
        super.draw(withFrame: cellFrame, in: controlView)
        if borderColor != .clear {
            bounds.lineWidth = 2
            borderColor.setStroke()
            bounds.stroke()
        }
    }
}
