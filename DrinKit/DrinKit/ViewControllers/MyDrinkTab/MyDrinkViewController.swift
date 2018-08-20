//
//  MyDrinkViewController.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 26..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyDrinkViewController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        addBottomLineToUserNameLabel()
        setButtonBar()
        super.viewDidLoad()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let MyDrinkListVC = UIStoryboard(name: "MyDrinkTab", bundle: nil).instantiateViewController(withIdentifier: "MyDrinkList")
        let MyReviewListVC = UIStoryboard(name: "MyDrinkTab", bundle: nil).instantiateViewController(withIdentifier: "MyReviewList")
        return [MyDrinkListVC, MyReviewListVC]
    }
    
    private func setButtonBar() {
        
        settings.style.buttonBarBackgroundColor = UIColor.init(named: "ButtonBarBackground")!
        settings.style.buttonBarItemBackgroundColor = UIColor.init(named: "ButtonBarBackground")!
        settings.style.selectedBarBackgroundColor = UIColor.init(named: "Background")!
        settings.style.buttonBarItemFont = UIFont.init(name: "NotoSansCJKkr-Medium", size: 16)!
        
        settings.style.selectedBarHeight = 3.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = UIColor.white.withAlphaComponent(0.5)
            newCell?.label.textColor = UIColor.white
            
            if animated {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }
            else {
                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }
    
    private func addBottomLineToUserNameLabel() {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: userNameLabel.frame.height - 1, width: userNameLabel.frame.width, height: 1)
        bottomLayer.backgroundColor = UIColor.white.cgColor
        userNameLabel.layer.addSublayer(bottomLayer)
    }
    

        
}
