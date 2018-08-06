//
//  HomeViewController.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 23..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - MODEL
    private let countOfBrands = 30
    
    // MARK: - UI
    @IBOutlet weak var eventScrollView: UIScrollView!
    @IBOutlet weak var eventScrollPageControl: UIPageControl!
    @IBOutlet weak var brandCollectionView: UICollectionView!
    @IBOutlet weak var brandCollectionPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventScrollView.delegate = self
        brandCollectionView.delegate = self
        brandCollectionView.dataSource = self
        setCollectionViewFlowLayout()
        setNumberOfBrandCollectionPages()
    }
    
    // MARK: - Prepare for BrandInfoVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let brandInfoVC = segue.destination as? BrandInfoViewController else { return }
        //        guard let selectedBrandCell = sender as? BrandCell else { return }
        //        guard let indexPath = brandCollectionView.indexPath(for: selectedBrandCell) else { return }
        brandInfoVC.title = "Brand Name"
    }
    
}

// MARK: - BrandCollectionView
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countOfBrands
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let brandCell = brandCollectionView.dequeueReusableCell(withReuseIdentifier: Keyword.HomeView.brandCell.reuseId, for: indexPath) as? BrandCell else { return UICollectionViewCell() }
        brandCell.brandName.text = "\(indexPath.row + 1)번째 브랜드"
        return brandCell
    }
    
}

// MARK: - BrandCollectionViewFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    private func setCollectionViewFlowLayout() {
        let itemWidth = UIScreen.main.bounds.width / 3.0
        let horizontalCV = HorizontalCollectionViewLayout();
        horizontalCV.itemSize = CGSize(width: itemWidth, height: itemWidth)
        brandCollectionView.collectionViewLayout = horizontalCV
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}

// MARK: - PageControl
extension HomeViewController {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        brandCollectionPageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    private func setNumberOfBrandCollectionPages() {
        brandCollectionPageControl.numberOfPages = { () -> Int in
            guard countOfBrands % 9 == 0 else { return countOfBrands / 9 + 1}
            return countOfBrands / 9
        }()
    }
}

