//
//  MyDrinkListViewController.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 8. 20..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyDrinkListViewController: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet weak var MyDrinkCollectionView: UICollectionView!
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "즐겨찾는 음료")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        MyDrinkCollectionView.delegate = self
        MyDrinkCollectionView.dataSource = self
    }

}

// MARK: - MyDrinkCollectionView
extension MyDrinkListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let beverageCell = collectionView.dequeueReusableCell(withReuseIdentifier: Keyword.BeveragesView.beverageCell.reuseId, for: indexPath) as? BeverageCell else { return UICollectionViewCell() }
        beverageCell.beverageNameKR.text = "\(indexPath.row + 1)번째 음료"
        beverageCell.beverageNameEN.text = "\(indexPath.row + 1)번째 음료"
        return beverageCell
    }
    
}

// MARK: - MyDrinkCollectionViewFlowLayout
extension MyDrinkListViewController: UICollectionViewDelegateFlowLayout {
    
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
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
}
