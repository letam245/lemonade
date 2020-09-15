//
//  ProductCell.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/15/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productPhoto: RoundImage!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var averageComission: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateProductDetail(photo: String?, name: String, price: Double, commision: String) {
        productPhoto.sd_setImage(with: URL(string: photo ?? ""), placeholderImage: UIImage(named: "placeholder-profile"))
        productName.text = name
        productPrice.text = "$\(String(format: "%.2f", price))"
        averageComission.text = commision
    }
}
