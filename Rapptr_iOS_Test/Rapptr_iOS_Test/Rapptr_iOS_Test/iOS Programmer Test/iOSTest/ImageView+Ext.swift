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
        self.layer.cornerRadius = self.frame.height/2
    }
}
