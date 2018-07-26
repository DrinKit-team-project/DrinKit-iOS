//
//  SearchViewController.swift
//  DrinKit
//
//  Created by JakeLEE on 2018. 7. 26..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var recommendScrollView: UIScrollView!
    @IBOutlet weak var topReviewCountButton: UIButton!
    @IBOutlet weak var topReviewImageStackView: UIStackView!
    @IBOutlet weak var newMenuCountButton: UIButton!
    @IBOutlet weak var newMenuImageStackView: UIStackView!

    private var searchController : UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let searchResultViewController
            = storyboard?.instantiateViewController(withIdentifier: "SearchResult")
                as? SearchResultViewController else { return }
        searchController = UISearchController(searchResultsController: searchResultViewController)
        searchController?.searchResultsUpdater = searchResultViewController
        searchController?.searchBar.placeholder = "Search"
        navigationItem.titleView = searchController?.searchBar
        searchController?.hidesNavigationBarDuringPresentation = false
        searchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
