//
//  Cafe.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 8. 24..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

struct Cafe: Decodable {
    
    let categoryNames: [String]
    let deleted: Bool
    let id: Int
    let name: String
    let imageURL: String
    let menus: [Menu]?
    
}








