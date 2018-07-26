//
//  BeverageDetailViewController.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 25..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

class BeverageDetailViewController: UIViewController {
    @IBOutlet weak var beverageDetailScrollView: UIScrollView!
    @IBOutlet weak var reviewTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        reviewTableView.estimatedRowHeight = reviewTableView.rowHeight
        reviewTableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    //    func configureSelfHeight() {
    //        beverageDetailScrollView.contentSize.height =  UIScreen.main.bounds.height + reviewTableView.contentSize.height
    //    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //                beverageDetailScrollView.contentSize.height = UIScreen.main.bounds.height + reviewTableView.contentSize.height
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        beverageDetailScrollView.contentSize.height = view.frame.height + reviewTableView.contentSize.height
        //        configureSelfHeight()
    }
    
}

extension BeverageDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let reviewCell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell") as? ReviewCell else { return UITableViewCell() }
        return reviewCell
    }
    
    
    
}
