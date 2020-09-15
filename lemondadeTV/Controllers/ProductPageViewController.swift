//
//  ProductPageViewController.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/15/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import UIKit

class ProductPageViewController: UIViewController {

    @IBOutlet weak var productAvatar: RoundImage!
    @IBOutlet weak var productCount: UILabel!
    @IBOutlet weak var averageComission: UILabel!
    @IBOutlet weak var connectionCount: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var brandDescription: UILabel!
    @IBOutlet weak var productListTableView: UITableView!
    
    var selectBrand : Brand?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBrandInfo()
        self.navigationController?.navigationBar.backItem?.title = ""
    }
    
    func updateBrandInfo() {
        productAvatar.sd_setImage(with: URL(string: selectBrand?.PictureUrl ?? ""), placeholderImage: UIImage(named: "placeholder-profile"))
        productCount.text = "\(selectBrand?.ProductCount ?? 0)"
        brandName.text = selectBrand?.Name
        brandDescription.text = selectBrand?.Description
        averageComission.text = selectBrand?.CommissionRange
        connectionCount.text = "\(selectBrand?.SellerCount ?? 0)"
    }

}
