//
//  Color+Ext.swift
//  iOSTest
//
//  Created by Jocelyn Boyd on 8/13/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func getCustomHeaderBackgroundColor() -> UIColor {
        //HEX - #0E5C89
     return UIColor(red: 17/255, green: 92/255, blue: 137/255, alpha: 1)
    }
    
    class func getCustomerHeaderTextColor() -> UIColor {
        //HEX - #FFFFFF
        return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
    
    class func getCustomChatBackgroundColor() -> UIColor {
        //HEX - #EFEFEF
        return UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
    }
    
    class func getCustomUIViewBackgroundColor() -> UIColor {
        //HEX - #F9F9F9
        return UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    }
    
    class func getCustomPlaceholderColor() -> UIColor {
        //HEX - #5F6063
        return UIColor(red: 95/255, green: 96/255, blue: 99/255, alpha: 1)
    }
    
}
