//
//  ResponsiveCollectionView.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/15/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func setupGridView(cellMargin: CGFloat) {
        let flow = self.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(cellMargin)
        flow.minimumLineSpacing = CGFloat(cellMargin)
    }
    
    func calculateWith(cellNumbers : Int) -> CGFloat {
        let flowLayout = self.collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(cellNumbers - 1))

        let size = Int((self.bounds.width - totalSpace) / CGFloat(cellNumbers))
        
        return CGFloat(size)
    }
}

