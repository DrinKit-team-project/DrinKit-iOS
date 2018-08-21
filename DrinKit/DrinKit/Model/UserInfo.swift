//
//  UserInfo.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 8. 2..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation
import UIKit

struct UserInfo: Codable {
    
    var name: String
    var email: String
    var provider: String
    var nickName: String
    var JWTToken: String
    
    init() {
        name = ""
        email = ""
        provider = ""
        nickName = ""
        JWTToken = ""
    }
    
}
