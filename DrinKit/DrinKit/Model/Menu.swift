//
//  Menu.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 8. 24..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

struct Menu: Decodable {
    
    let cafe: Cafe
    let calories: Int
    let category: String
    let deleted: Bool
    let description: String
    let enName: String
    let id: Int
    let imageURLs: [String]
    let krName: String
    let pricePerSizes: [PricePerSize]
    let reviewCount: Int
    let tagList: [Tag]
    let totalRatings: Double
    
}
