//
//  BeveragesViewController.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 24..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

class BeveragesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var beverageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beverageCollectionView.delegate = self
        beverageCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let beverageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeverageCell", for: indexPath) as? BeverageCell else { return UICollectionViewCell() }
        beverageCell.priceLabel.text = "\(indexPath.row + 1)번째 음료"
        return beverageCell
    }

}

extension BeveragesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = UIScreen.main.bounds.width / 2.0
        return CGSize(width: itemWidth - 20, height: itemWidth + 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
    }
}
