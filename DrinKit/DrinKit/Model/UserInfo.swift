//
//  UserInfo.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 8. 2..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation
import UIKit

import Foundation
import UIKit

typealias BasicInformation = (profileImage: UIImage, name: String, email: String)

class UserInformation {
    
    var basicInformation: BasicInformation
    var nickName: String
    
    static let sharedInstance: UserInformation = UserInformation()
    
    func setBasicInformation(_ userBasicInformation: BasicInformation) {
        basicInformation = userBasicInformation
    }
    
    func setNickname(_ userNickname: String) {
        nickName = userNickname
    }
    
    private init() {
        basicInformation = (UIImage(), "", "")
        nickName = ""
    }
    
}
