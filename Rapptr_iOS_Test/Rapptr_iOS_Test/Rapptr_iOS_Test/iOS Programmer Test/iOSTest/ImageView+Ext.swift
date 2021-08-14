//
//  ImageView+Ext.swift
//  iOSTest
//
//  Created by Jocelyn Boyd on 8/13/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
