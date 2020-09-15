//
//  LayoutHelper.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/15/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import Foundation
import UIKit

struct LayoutHelper {
    static func topBarHeight(_ vc : UIViewController?) -> CGFloat {
        if #available(iOS 13.0, *) {
            return (vc?.view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                     (vc?.navigationController?.navigationBar.frame.height ?? 0.0)
             } else {
                 let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
                 (vc?.navigationController?.navigationBar.frame.height ?? 0.0)
                 return topBarHeight
             }
    }
    
    static func isIpad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static func screenWith() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    static func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
}
