//
//  BranchesViewController.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/15/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import UIKit

class BranchesViewController: UIViewController {

    @IBOutlet weak var branchesCollectionView: UICollectionView!
    
    var branchesList = [Brand]()
    var selectedBrand : Brand?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        branchesCollectionView.delegate = self
        branchesCollectionView.dataSource = self
        
        branchesCollectionView.register(UINib(nibName: "BranchCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BranchCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchBranches()
    }
    
    
    func fetchBranches() {
        do {
            let branches = try JSONDecoder().decode([Brand].self, from: BrandMockData)
            branchesList = branches
            branchesCollectionView.reloadData()
        } catch {
            print(error)
        }
    }
    
    func goToProductPage(_ brand: Brand) {
        selectedBrand = brand
        self.performSegue(withIdentifier: "goToProductPage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let productPageVC = segue.destination as! ProductPageViewController
        
        productPageVC.selectBrand = selectedBrand

    }
    

}

extension BranchesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return branchesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let brandCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BranchCell", for: indexPath) as! BranchCellCollectionViewCell
        let brand = branchesList[indexPath.row]
        brandCell.brandVCdelegate = self
        brandCell.brand = brand
        brandCell.actionButton.tag = indexPath.row
        
        
        brandCell.updateBranchInfo(name: brand.Name, status: brand.ApplicationStatusCode ?? "", photo: brand.PictureUrl)
        
        
        return brandCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = branchesCollectionView.calculateWith(cellNumbers: 3)

        return CGSize(width: size, height: size * 1.75)
    }
    
    
}
