//
//  UITextField+Ext.swift
//  iOSTest
//
//  Created by Jocelyn Boyd on 8/16/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setLeftPaddingInset(_ padding: CGFloat) {
        let paddingView =  UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
    }
    
    func setPlaceholderColor(placeholder: String) -> NSAttributedString {
        let placeholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor.getLoginPlaceholderTextColor()])
        return placeholder
    }
}
