//
//  UserInfo.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 8. 2..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation
import UIKit

class UserInfo {
    
    enum Provider {

        case FACEBOOK
        case KAKAO
        case none

        var value: String {
            switch self {
            case .FACEBOOK: return "FACEBOOK"
            case .KAKAO: return "KAKAO"
            case .none: return "None"
            }
        }
    }
    
    // BasicInfo
    private(set) var name: String
    private(set) var email: String
    private(set) var provider: Provider
    private(set) var parameters: [String:Any]
    
    // AdditionalInfo
    private(set) var profileImage: UIImage
    private var nickName: String
    private(set) var JWTToken: String
    
    static var sharedInstance: UserInfo = UserInfo()
    
    private init() {
        profileImage = UIImage()
        name = ""
        email = ""
        provider = .none
        parameters = [:]
        nickName = ""
        JWTToken = ""
    }
    
    func setBasicInformation(_ userName: String, _ userNameEmail: String) {
        name = userName
        email = userNameEmail
    }
    
    func setParameters(_ userProvider: Provider, _ userID: String, _ userToken: String) {
        provider = userProvider
        parameters["provider"] = userProvider.value
        parameters["id"] = Int(userID)
        parameters["token"] = userToken
    }
    
    func setProfileImage(_ userProfileImage: UIImage) {
        profileImage = userProfileImage
    }
 
    func setNickName(_ userNickName: String) {
        nickName = userNickName
    }
    
    func setJWTToken(_ userJWT: String) {
        JWTToken = userJWT
    }
    
}
