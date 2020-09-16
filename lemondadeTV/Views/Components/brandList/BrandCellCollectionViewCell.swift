//
//  BranchCellCollectionViewCell.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/15/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import UIKit

class BrandCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var branchAvatar: RoundImage!
    @IBOutlet weak var branchName: UILabel!
    @IBOutlet weak var actionButton: CustomButton!
    
    var brandVCdelegate : BrandViewController?
    var searchVCdelegate: BrandSearchViewController?
    var brand: Brand?
    var fromSearch: Bool? = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateBranchInfo(name: String, status: String, photo: String?) {
        branchName.text = name
        branchAvatar.sd_setImage(with: URL(string: photo ?? ""), placeholderImage: UIImage(named: "placeholder-profile"))
        switch status {
        case "Pending":
            buttonStyle(color: ColorHelper.lemonadeColor("ldLightGray"), title: "Pending", titleColor: .darkGray)
        case "Approved":
            buttonStyle(color: ColorHelper.lemonadeColor("ldYellow"), title: "Approved", titleColor: .darkGray)
        case "Denied":
            buttonStyle(color: ColorHelper.lemonadeColor("ldRed"), title: "Denied", titleColor: .darkGray)
        default:
            buttonStyle(color: .clear, boderColor: ColorHelper.lemonadeColor("ldYellow"), title: "Apply")
            break
        }
    }
    
    func buttonStyle(color: UIColor, boderColor: UIColor? = .clear, title: String, titleColor: UIColor? = .white) {
        actionButton.backgroundColor = color
        actionButton.borderColor = boderColor
        actionButton.setTitle(title, for: .normal)
        actionButton.setTitleColor(titleColor, for: .normal)
    }
    


    @IBAction func handleApplyClicked(_ sender: Any) {
        guard let brand = brand else {return}
        brandVCdelegate?.goToProductPage(brand)
        if fromSearch ?? false {searchVCdelegate?.goToProductPage(brand)}
    }
}
