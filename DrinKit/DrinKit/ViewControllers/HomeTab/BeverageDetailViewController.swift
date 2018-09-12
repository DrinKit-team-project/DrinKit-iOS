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
    @IBOutlet weak var starRatingBackgroundView: UIView!
    
    
    private var reviews = [Review]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setReviews()
        setStarRatingView()
    }

    private func setTableView() {
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        reviewTableView.estimatedRowHeight = reviewTableView.rowHeight
        reviewTableView.rowHeight = UITableViewAutomaticDimension
    }

    private func setReviews() {
        NetworkManager.shared.request(urlString: "", targetType: [Review].self) { [weak self] (model: [Review]?) in
            guard let `self` = self else { return }
            guard let model = model else { return }
            self.reviews = model
            self.reviewTableView.reloadData()
        }
    }
    
    private func setStarRatingView() {
        let starRatingView = StarRatingView()
        starRatingView.isUserInteractionEnabled = false
        starRatingView.setColors(textColor: UIColor(named: "BeverageDescription")!, backgroundColor: .white)
        starRatingView.setStarSize(15)
        starRatingBackgroundView.addSubview(starRatingView)
        starRatingBackgroundView.snp.makeConstraints { (make) in
            make.centerX.equalTo(starRatingView.snp.centerX)
            make.centerY.equalTo(starRatingView.snp.centerY)
        }
        
    }
}

// MARK: - UITableViewDataSource
extension BeverageDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let reviewCell = tableView.dequeueReusableCell(withIdentifier: Keyword.BeverageDetailView.reviewCell.reuseId) as? ReviewCell else { return UITableViewCell() }
        return reviewCell
    }
}

// MARK: - UITableViewDelegate
extension BeverageDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
