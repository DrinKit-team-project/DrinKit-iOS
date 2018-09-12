//
//  ReviewCell.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 25..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var reviewImage: UIImageView!
    @IBOutlet weak var reviewInfoView: UIView!
    @IBOutlet weak var reviewIdLabel: UILabel!
    @IBOutlet weak var reviewTextView: UITextView!

    func setReviewCell(with review: Review) {
        NetworkManager.shared.downloadImage(urlString: review.uploadFileResponse.fileDownloadUri, imageView: reviewImage) {
            [weak self] in
            self?.reviewImage.setNeedsDisplay()
        }
        reviewIdLabel.text = review.menu.krName
        reviewTextView.text = review.contents
        setStarRatingView(review.ratings)
    }

    func setStarRatingView(_ ratings: Double) {
        reviewInfoView.subviews.filter({$0 is StarRatingView}).forEach({$0.removeFromSuperview()})
        let starRatingView = StarRatingView()
        starRatingView.isUserInteractionEnabled = false
        starRatingView.rating = ratings
        starRatingView.text = "\(ratings)"
        starRatingView.setStarSize(15)
        reviewInfoView.addSubview(starRatingView)
        starRatingView.snp.makeConstraints { (make) in
            make.trailing.equalTo(reviewInfoView.snp.trailing)
            make.bottom.equalTo(reviewInfoView.snp.bottom)
        }
    }
}
