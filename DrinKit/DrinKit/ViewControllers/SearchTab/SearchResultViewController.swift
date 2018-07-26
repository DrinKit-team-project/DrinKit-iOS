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

    private var searchResult: [String] = ["test"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        print("result view controller")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SearchResultViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        print(searchText)
    }
}

extension SearchResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell") else { return UITableViewCell() }
        cell.textLabel?.text = searchResult[indexPath.row]
        return cell
    }
}
