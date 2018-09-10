//
//  Writer.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 9. 7..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

struct Writer: Decodable {
    
    let id: Int
    let nickName: String
    let password: String
    let profileHref: String
    let socialId: String
    let socialProvider: String
    let userId: String
    let userRole: String
    
}
