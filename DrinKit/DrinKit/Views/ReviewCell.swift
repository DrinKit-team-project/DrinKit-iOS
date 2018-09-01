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
    @IBOutlet weak var reviewIdLabel: UILabel!
    @IBOutlet weak var reviewStarStackView: UIStackView!
    @IBOutlet weak var reviewTextView: UITextView!

    func setReviewCell(with review: Review) {
        NetworkManager.shared.downloadImage(urlString: review.drinkImgUrl, imageView: reviewImage) {
            [weak self] in
            self?.reviewImage.setNeedsDisplay()
        }
        reviewIdLabel.text = review.menu.krName
        reviewTextView.text = review.contents
        let fullStarCount = Int(review.ratings)
        for index in 0..<fullStarCount {
            guard let imageView = reviewStarStackView.arrangedSubviews[index] as? UIImageView else { break }
            imageView.image = #imageLiteral(resourceName: "FullStar")
        }
        if review.ratings - Double(fullStarCount) != 0 {
            guard let imageView = reviewStarStackView.arrangedSubviews[fullStarCount] as? UIImageView else { return }
            imageView.image = #imageLiteral(resourceName: "HalfAlphaStar")
        }
    }
}
