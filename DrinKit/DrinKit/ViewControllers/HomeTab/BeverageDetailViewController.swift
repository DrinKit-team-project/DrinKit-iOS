//
//  BeverageDetailViewController.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 25..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

class BeverageDetailViewController: UIViewController {
    
    // MARK: - UI
    @IBOutlet weak var beverageDetailScrollView: UIScrollView!
    @IBOutlet weak var thumbnailsScrollView: UIScrollView!
    @IBOutlet weak var reviewTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        reviewTableView.estimatedRowHeight = reviewTableView.rowHeight
        reviewTableView.rowHeight = UITableViewAutomaticDimension
    }
    
}

// MARK: - ReviewTableView
extension BeverageDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let reviewCell = tableView.dequeueReusableCell(withIdentifier: Keyword.BeverageDetailView.reviewCell.reuseId) as? ReviewCell else { return UITableViewCell() }
        return reviewCell
    }
    
}
