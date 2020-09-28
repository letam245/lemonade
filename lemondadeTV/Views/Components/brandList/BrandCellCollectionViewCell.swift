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
        let imageClicked = UITapGestureRecognizer(target: self, action: #selector(selectImageCliclked))
        branchAvatar.isUserInteractionEnabled = true
        branchAvatar.addGestureRecognizer(imageClicked)
    }
    
    @objc func selectImageCliclked()
    {
        guard let brand = brand else {return}
        brandVCdelegate?.goToProductPage(brand)
    }
    
    func updateBranchInfo(name: String, status: String, photo: String?) {
        branchName.text = name
        branchAvatar.sd_setImage(with: URL(string: photo ?? ""), placeholderImage: UIImage(named: "placeholder-profile"))
        BrandApplyBtnHelper.buttonCase(actionButton, status: status)
    }


    @IBAction func handleApplyClicked(_ sender: Any) {
        guard let brand = brand else {return}
        brandVCdelegate?.presentGuidelineModal(brand)
        if fromSearch ?? false {searchVCdelegate?.goToProductPage(brand)}
    }
}
