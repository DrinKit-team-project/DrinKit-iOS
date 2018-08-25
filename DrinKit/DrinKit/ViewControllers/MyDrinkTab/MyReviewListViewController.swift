//
//  MyReviewListViewController.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 8. 20..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyReviewListViewController: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet weak var myReviewTableView: UITableView!
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "내가 쓴 리뷰")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        myReviewTableView.delegate = self
        myReviewTableView.dataSource = self
    }
}

// MARK: - ReviewTableView
extension MyReviewListViewController: UITableViewDelegate, UITableViewDataSource {
    
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
