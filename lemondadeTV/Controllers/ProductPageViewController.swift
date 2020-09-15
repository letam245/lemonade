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
    var productList = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBrandInfo()
        productListTableView.delegate = self
        productListTableView.dataSource = self
        productListTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchProducts()
    }
    
    func updateBrandInfo() {
        productAvatar.sd_setImage(with: URL(string: selectBrand?.PictureUrl ?? ""), placeholderImage: UIImage(named: "placeholder-profile"))
        productCount.text = "\(selectBrand?.ProductCount ?? 0)"
        brandName.text = selectBrand?.Name
        brandDescription.text = selectBrand?.Description
        averageComission.text = selectBrand?.CommissionRange
        connectionCount.text = "\(selectBrand?.SellerCount ?? 0)"
    }
    
    func fetchProducts() {
        do {
            let products = try JSONDecoder().decode([Product].self, from: ProductMockData)
            productList = products
            productListTableView.reloadData()
        } catch {
            print(error)
        }
    }
    
    func presentGuidelineModal() {
        let guideLineModal = storyboard?.instantiateViewController(withIdentifier: "guideLineModalVC") as! GuidelineModalViewController
        
        guideLineModal.productDelegate = self
        guideLineModal.brand = selectBrand
        present(guideLineModal, animated: true, completion: nil)
    }
    
    @IBAction func openBranchGuidelineModal(_ sender: Any) {
        self.presentGuidelineModal()
    }
    
}

extension ProductPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        productCell.selectionStyle = .none
        let product = productList[indexPath.row]

        productCell.updateProductDetail(photo: product.picture?.url, name: product.name, price: product.price, commision: selectBrand?.CommissionRange ?? "")
        
        return productCell
    }
    
}
