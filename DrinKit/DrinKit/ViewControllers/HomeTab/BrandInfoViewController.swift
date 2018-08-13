//
//  BrandInfoViewController.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 24..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

class BrandInfoViewController: UIViewController {
    
    //MARK: - UI
    @IBOutlet weak var brandImage: UIImageView!
    @IBOutlet weak var categoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
    }
    
    //MARK: - Prepare for BeveragesView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let beveragesVC = segue.destination as? BeveragesViewController else { return }
        beveragesVC.drinkPath = "Brand-Category-Beverage"
    }

}

// MARK: - CategoryTableView
extension BrandInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categoryCell = categoryTableView.dequeueReusableCell(withIdentifier: Keyword.BrandInfoView.categoryCell.reuseId, for: indexPath) as? CategoryCell else { return UITableViewCell() }
        categoryCell.categoryKR.text = "\(indexPath.row + 1)번째 카테고리"
        categoryCell.categoryEN.text = "Category"
        return categoryCell
    }
    
    
}
