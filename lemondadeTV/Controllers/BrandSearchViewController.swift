//
//  BrandSSearchViewController.swift
//  lemondadeTV
//
//  Created by Tammy Le on 9/15/20.
//  Copyright © 2020 Tammy Le. All rights reserved.
//

import UIKit

class BrandSearchViewController: UIViewController {

    @IBOutlet weak var brandSearchBar: UISearchBar!
    @IBOutlet weak var brandSearchCollectionView: UICollectionView!
    
    var brandList : [Brand]?
    var selectedBrand : Brand?
    
    var filteredBrand: [Brand] = []
    var startSearch : Bool = false
    
    
//    let searchController = UISearchController(searchResultsController: nil)
//    var isFiltering: Bool {
//        return searchController.isActive && !(searchController.searchBar.text?.isEmpty ?? true)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brandSearchCollectionView.delegate = self
        brandSearchCollectionView.dataSource = self
        brandSearchBar.delegate = self
        customSearchBarUI()
        //configSearchController()
        
        brandSearchCollectionView.register(UINib(nibName: "BrandCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BranchCell")
    }
    
    func customSearchBarUI() {
        brandSearchBar.backgroundImage = UIImage()
        brandSearchBar.searchTextField.backgroundColor = .clear
        brandSearchBar.searchTextField.leftView?.tintColor = .white
        brandSearchBar.searchTextField.textColor = .white
    }
    
//    func configSearchController() {
//        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchBar.placeholder = "Search For Brand..."
//        navigationItem.searchController = searchController
//        definesPresentationContext = true
//    }
    
    func filterForName(_ searchText: String) {
        filteredBrand = brandList!.filter { (brand: Brand) -> Bool in
            return brand.Name.lowercased().contains(searchText.lowercased())
        }
        
        brandSearchCollectionView.reloadData()
    }
    
    func goToProductPage(_ brand: Brand) {
        selectedBrand = brand
        self.performSegue(withIdentifier: "goToProduct", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let productPageVC = segue.destination as! ProductPageViewController
        productPageVC.selectBrand = selectedBrand
    }

}

extension BrandSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if startSearch {return filteredBrand.count}
        return brandList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let brandCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BranchCell", for: indexPath) as! BrandCellCollectionViewCell
        let brand = startSearch ? filteredBrand[indexPath.row] : brandList?[indexPath.row]
        brandCell.brand = brand
        brandCell.searchVCdelegate = self
        brandCell.fromSearch = true
        brandCell.actionButton.tag = indexPath.row
        
        
        brandCell.updateBranchInfo(name: brand?.Name ?? "", status: brand?.ApplicationStatusCode ?? "", photo: brand?.PictureUrl)
        
        
        return brandCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = brandSearchCollectionView.calculateWith(cellNumbers: 3)
        return CGSize(width: size, height: size * 1.75)
    }
    
}

extension BrandSearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        startSearch = true
        filterForName(searchText)
        if searchText == "" {
            startSearch = false
            brandSearchCollectionView.reloadData()
          }
    }
}

//extension BrandSearchViewController: UISearchResultsUpdating {
//  func updateSearchResults(for searchController: UISearchController) {
//    let searchBar = searchController.searchBar
//    filterForName(searchBar.text!)
//  }
//}
