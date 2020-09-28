//
//  BrandApplyBtnHelper.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/27/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import Foundation
import UIKit

struct BrandApplyBtnHelper {
    static func buttonStyle(_ actionButton: CustomButton, color: UIColor, boderColor: UIColor? = .clear, title: String, titleColor: UIColor? = .white) {
        actionButton.backgroundColor = color
        actionButton.borderColor = boderColor
        actionButton.setTitle(title, for: .normal)
        actionButton.setTitleColor(titleColor, for: .normal)
    }
    
    static func buttonCase(_ actionButton: CustomButton, status: String) {
        switch status {
        case "Pending":
            buttonStyle(actionButton, color: ColorHelper.lemonadeColor("ldLightGray"), title: "Pending", titleColor: .darkGray)
            actionButton.isEnabled = false
        case "Approved":
            buttonStyle(actionButton, color: ColorHelper.lemonadeColor("ldYellow"), title: "Approved", titleColor: .darkGray)
            actionButton.isEnabled = false
        case "Denied":
            buttonStyle(actionButton, color: ColorHelper.lemonadeColor("ldRed"), title: "Denied", titleColor: .darkGray)
            actionButton.isEnabled = false
        default:
            buttonStyle(actionButton, color: .clear, boderColor: ColorHelper.lemonadeColor("ldYellow"), title: "Apply")
            actionButton.isEnabled = true
            break
        }
    }
}
