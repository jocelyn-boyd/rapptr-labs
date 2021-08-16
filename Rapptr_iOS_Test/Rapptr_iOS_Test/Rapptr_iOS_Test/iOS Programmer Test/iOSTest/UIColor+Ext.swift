//
//  Color+Ext.swift
//  iOSTest
//
//  Created by Jocelyn Boyd on 8/13/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

extension UIColor {
    
    //MARK: - Background Colors
    class func getHeaderBackgroundColor() -> UIColor {
        //HEX - #0E5C89
     UIColor(red: 17/255, green: 92/255, blue: 137/255, alpha: 1)
    }
    
    class func getChatBackgroundColor() -> UIColor {
        //HEX - #EFEFEF
        UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
    }
    
    class func getUIViewBackgroundColor() -> UIColor {
        //HEX - #F9F9F9
        UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    }
    
    //MARK: - Text Colors
    class func getHeaderTextColor() -> UIColor {
        //HEX - #FFFFFF
        UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
    
    class func getLoginPlaceholderTextColor() -> UIColor {
        //HEX - #5F6063
        UIColor(red: 95/255, green: 96/255, blue: 99/255, alpha: 1)
    }
    
    class func getLoginFilledTextColor() -> UIColor {
        //HEX - #1B1E1F
        UIColor(red: 27/255, green: 30/255, blue: 31/255, alpha: 1)
    }
}
