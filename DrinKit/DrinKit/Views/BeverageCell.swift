//
//  BeverageCell.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 24..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

class BeverageCell: UICollectionViewCell {
    
    @IBOutlet weak var beverageNameKR: UILabel!
    @IBOutlet weak var beverageNameEN: UILabel!
    @IBOutlet weak var beverageImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var myDrinkBtn: UIButton!
    
    @IBAction func myDrinkBtnTouched(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            myDrinkBtn.isSelected = true
        }
    }
}
