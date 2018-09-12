//
//  BrandCell.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 23..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

class BrandCell: UICollectionViewCell {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var brandName: UILabel!
    
    func set(_ cafe: Cafe) {
        logoImage.layer.borderWidth = 1
        logoImage.layer.borderColor = UIColor.white.cgColor
        logoImage.layer.cornerRadius = logoImage.frame.width / 2
        NetworkManager.shared.downloadImage(urlString: cafe.imageURL, imageView: logoImage) {
            [weak self] in
            self?.logoImage.setNeedsDisplay()
        }
        brandName.text = cafe.name
    }

}
