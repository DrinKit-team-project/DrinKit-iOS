//
//  Review.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 8. 24..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

struct Review: Decodable {
    
    let ratings: Double
    let contents: String
    let drinkImgUrl: String
    let menu: Menu
    
}
