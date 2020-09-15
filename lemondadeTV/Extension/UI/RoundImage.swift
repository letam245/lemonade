//
//  RoundImage.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/15/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import UIKit
import Foundation
import SDWebImage

@IBDesignable
class RoundImage: UIImageView {
    @IBInspectable var roundedCorners: Bool = true {
        didSet { setNeedsLayout() }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if roundedCorners {
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = UIBezierPath(ovalIn:
                CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: bounds.height
            )).cgPath
            layer.mask = shapeLayer
        }
        else {
            layer.mask = nil
        }
        
    }
    
    @IBInspectable var borderWidth : CGFloat {
        get { layer.borderWidth }
        set {
            layer.masksToBounds = true
            layer.borderWidth = newValue
            layer.cornerRadius = frame.size.width / 2
        }
    }
    
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    @IBInspectable var cornersRadius: CGFloat {
        get {layer.cornerRadius}
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
    }


}
