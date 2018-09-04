//
//  ReviewStarMaker.swift
//  DrinKit
//
//  Created by JakeLEE on 2018. 8. 25..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

struct ReviewStarMaker {
    static func make(score: Double) -> UIView {
        var starImages = [UIImageView]()
        let coloredStarCount = Int(score)
        for _ in 0..<coloredStarCount {
            starImages.append(UIImageView(image: UIImage(named: "HalfAlphaStar")!))
        }
        let starStackView = UIStackView(arrangedSubviews: starImages)
        starStackView.axis = .horizontal
        starStackView.spacing = 0
        let viewWidth = starStackView.frame.width
        let viewHeight = starStackView.frame.height
        let parentView = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        let colorView = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth / CGFloat(5) * CGFloat(score), height: viewHeight))
        colorView.backgroundColor = UIColor.red
        parentView.addSubview(colorView)
        parentView.addSubview(starStackView)
        colorView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor)
        colorView.topAnchor.constraint(equalTo: parentView.topAnchor)
        colorView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
        starStackView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor)
        starStackView.topAnchor.constraint(equalTo: parentView.topAnchor)
        starStackView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
        return parentView
    }
}
