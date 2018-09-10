//
//  Tag.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 8. 24..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

struct Tag: Decodable {
    
    let id: Int
    let searchCount: Int
    let tagName: String
    let menus: [Menu]
    
}
