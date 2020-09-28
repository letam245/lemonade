//
//  BranchesViewController.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/15/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import UIKit

class BrandViewController: UIViewController {

    @IBOutlet weak var brandCollectionView: UICollectionView!
    
    var brandList = [Brand]()
    var selectedBrand : Brand?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brandCollectionView.delegate = self
        brandCollectionView.dataSource = self
        
        brandCollectionView.register(UINib(nibName: "BrandCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BranchCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchBranches { (branches, error) in
            guard let branches = branches else {return}
            self.brandList = branches
            DispatchQueue.main.async {
                self.brandCollectionView.reloadData()
           }
        }
    }
    
    func fetchBranches(completion: @escaping ([Brand]?, Error?) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let branches = try JSONDecoder().decode([Brand].self, from: BrandMockData)
                completion(branches, nil)
            } catch {
                completion(nil, error)
            }
        }

    }
    
    func goToProductPage(_ brand: Brand) {
        selectedBrand = brand
        self.performSegue(withIdentifier: "goToProductPage", sender: self)
    }
    
    func presentGuidelineModal(_ brand: Brand) {
        let guideLineModal = storyboard?.instantiateViewController(withIdentifier: "guideLineModalVC") as! GuidelineModalViewController
        
        guideLineModal.brandVCDelegate = self
        guideLineModal.brand = brand
        present(guideLineModal, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goToProductPage":
            let productPageVC = segue.destination as! ProductPageViewController
            productPageVC.selectBrand = selectedBrand
          case "goToSearchPage":
            let searchPageVC = segue.destination as! BrandSearchViewController
            searchPageVC.brandList = brandList
        default:
            break
        }
    }
    
    @IBAction func searchIconClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "goToSearchPage", sender: self)
    }
}

extension BrandViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brandList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let brandCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BranchCell", for: indexPath) as! BrandCellCollectionViewCell
        let brand = brandList[indexPath.row]
        brandCell.brandVCdelegate = self
        brandCell.brand = brand
        brandCell.actionButton.tag = indexPath.row
        
        
        brandCell.updateBranchInfo(name: brand.Name, status: brand.ApplicationStatusCode ?? "", photo: brand.PictureUrl)
        
        
        return brandCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = brandCollectionView.calculateWith(cellNumbers: 3)

        return CGSize(width: size, height: size * 1.75)
    }
    
}
