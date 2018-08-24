//
//  Menu.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 8. 24..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

struct Menu: Decodable {
    
    let krName: String
    let enName: String
    let calories: Int
    let category: String
    let description: String
    let totalRatings: Double
    let cafe: Cafe
    let reviews: [Review]
    let pricePerSizes: [PricePerSize]
    let tagList: [Tag]
    let imageURLs: [String]
    
}
