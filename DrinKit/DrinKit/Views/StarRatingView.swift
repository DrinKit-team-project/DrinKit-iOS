//
//  StarRatingView.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 9. 12..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit
import Cosmos
import SnapKit

class StarRatingView: CosmosView {
    
    override init(frame: CGRect, settings: CosmosSettings) {
        super.init(frame: frame, settings: settings)
        setBaseSettings()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setBaseSettings()
    }
    
    private func setBaseSettings() {
        self.settings.fillMode = .half
        self.text = "(0.0)"
        self.settings.textMargin = 2
        self.rating = 0
        self.settings.minTouchRating = 0
        self.settings.totalStars = 5
        self.settings.starMargin = 0
        self.settings.filledImage = UIImage(named: "FullStar")
        self.settings.emptyImage = UIImage(named: "HalfAlphaStar")
        self.didTouchCosmos = { rating in
            self.text = "(\(rating))"
        }
    }
    
    func setColors(textColor: UIColor, backgroundColor: UIColor) {
        settings.textColor = textColor
        self.backgroundColor = backgroundColor
    }
    
    func setSizeConstraints(width: Int, height: Int) {
        self.snp.makeConstraints { (make) in
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
    }
    
    func setStarSize(_ size: Double) {
        settings.starSize = size
    }

}
