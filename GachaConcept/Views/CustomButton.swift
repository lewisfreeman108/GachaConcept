//
//  CustomButton.swift
//  Test
//
//  Created by Lewis on 7/12/21.
//  Copyright © 2021 lewisfreeman. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = frame.size.height / 4
        layer.borderWidth = frame.size.height / 40
        layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
    }
    
    enum buttonStyle {
        case
        enabled,
        disabled
    }
    
    var style:buttonStyle = .enabled
    
    /*
    ///Workaround for enum values not being IBInspectable.
    @IBInspectable var isStandard: Bool = false {
      didSet {
        if isStandard {
          style = .standard
        } else {
          style = .warning
        }
      }
    }*/
}
