//
//  SearchViewController.swift
//  DrinKit
//
//  Created by JakeLEE on 2018. 7. 26..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchControllerDelegate {
    
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var recommendCollectionView: UIScrollView!
    @IBOutlet weak var topReviewCountButton: UIButton!
    @IBOutlet weak var topReviewImageStackView: UIStackView!
    @IBOutlet weak var newMenuCountButton: UIButton!
    @IBOutlet weak var newMenuImageStackView: UIStackView!

    private var searchController : UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let searchResultVC = storyboard?.instantiateViewController(withIdentifier: "SearchResult") as? SearchResultViewController else { return }
        searchController = UISearchController(searchResultsController: searchResultVC)
        searchController.delegate = self
        searchController.searchResultsUpdater = searchResultVC
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.barTintColor = UIColor(named: "Background")
        searchController.searchBar.tintColor = UIColor.white
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.showsScopeBar = false
        searchBarView.addSubview(searchController.searchBar)
        self.definesPresentationContext = true
        self.extendedLayoutIncludesOpaqueBars = false
    }
    
    func willPresentSearchController(_ searchController: UISearchController) {
            DispatchQueue.main.async {
                self.searchController.searchResultsController?.view.isHidden = false
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
