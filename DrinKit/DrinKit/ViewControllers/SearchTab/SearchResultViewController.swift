//
//  SearchResultViewController.swift
//  DrinKit
//
//  Created by JakeLEE on 2018. 7. 26..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private var searchResult: [String] = ["test1", "test2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.contentInsetAdjustmentBehavior = .never
        print("result view controller")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.autoresizesSubviews = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SearchResultViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension SearchResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell") as? SearchResultTableViewCell else { return UITableViewCell() }
        cell.searchedTextLabel.text = searchResult[indexPath.row]
        return cell
    }
}
