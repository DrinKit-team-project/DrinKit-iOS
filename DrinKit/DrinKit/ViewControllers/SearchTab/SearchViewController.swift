//
//  SearchViewController.swift
//  DrinKit
//
//  Created by JakeLEE on 2018. 7. 26..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var recommendCollectionView: UIScrollView!
    @IBOutlet weak var topReviewCountButton: UIButton!
    @IBOutlet weak var topReviewImageStackView: UIStackView!
    @IBOutlet weak var newMenuCountButton: UIButton!
    @IBOutlet weak var newMenuImageStackView: UIStackView!

    private var searchController : UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let searchResultVC = storyboard?.instantiateViewController(withIdentifier: "SearchResult")
            as? SearchResultViewController else { return }
        searchController = UISearchController(searchResultsController: searchResultVC)
        searchController.searchBar.heightAnchor.constraint(equalToConstant: 55).isActive = true
        searchController.searchResultsUpdater = searchResultVC
        searchController.searchBar.placeholder = "Search"
        searchBarView.addSubview(searchController.searchBar)
        searchController.searchBar.barTintColor = UIColor(named: "Background")
        searchController.searchBar.tintColor = UIColor.white
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = true
        searchController.searchBar.showsScopeBar = false
        searchController.definesPresentationContext = true
        searchController.extendedLayoutIncludesOpaqueBars = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
