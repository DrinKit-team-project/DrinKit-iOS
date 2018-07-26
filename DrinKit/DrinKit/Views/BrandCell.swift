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
    
    func set() {
        logoImage.layer.borderWidth = 1
        logoImage.layer.borderColor = UIColor.white.cgColor
        logoImage.layer.cornerRadius = logoImage.frame.width / 2
    }

}
