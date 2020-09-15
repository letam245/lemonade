//
//  ColorHelper.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/15/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import Foundation
import UIKit

struct ColorHelper {
    static func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") { cString.remove(at: cString.startIndex) }
        if cString.count != 6 { return UIColor.gray }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func lemonadeColor(_ colorChoice:  String) -> UIColor {
        
        if      colorChoice ==   "ldYellow"       { return UIColor(red:247/255, green:237/255, blue:86/255, alpha: 1.0) }
        else if colorChoice ==   "ldGray"         { return UIColor(red:140/255, green:139/255, blue:142/255, alpha: 1.0) }
        else if colorChoice ==   "ldLightGray"    { return UIColor(red:140/255, green:139/255, blue:142/255, alpha: 1.0) }
        else if colorChoice ==   "ldGray"         { return UIColor(red:76/255, green:152/255, blue:140/255, alpha: 1.0) }
        else if colorChoice ==   "ldRed"          { return UIColor(red:210/255, green:62/255, blue:62/255, alpha: 0.8)}
        else                                      {return UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1)}
        
    }
}

