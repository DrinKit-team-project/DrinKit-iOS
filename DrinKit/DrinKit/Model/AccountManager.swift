//
//  AccountManager.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 8. 21..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

class AccountManager {
    
    enum Provider {
        
        case FACEBOOK
        case KAKAO
        
        var value: String {
            switch self {
            case .FACEBOOK: return "FACEBOOK"
            case .KAKAO: return "KAKAO"
            }
        }
        
    }
    
    static var sharedInstance = AccountManager()
    
    private(set) var profileImage = UIImage()
    private(set) var userInfo = UserInfo()
    private(set) var parameters: [String:Any] = [:]
    
    private init() { }
    
    func setBasicInformation(_ userName: String, _ userNameEmail: String) {
        userInfo.name = userName
        userInfo.email = userNameEmail
    }
    
    func setProfileImage(_ userProfileImage: UIImage) {
        profileImage = userProfileImage
    }
    
    func setNickName(_ userNickName: String) {
        userInfo.nickName = userNickName
    }
    
    func setJWTToken(_ userJWT: String) {
        userInfo.JWTToken = userJWT
    }
    
    func setParameters(_ userProvider: Provider, _ userID: String, _ userToken: String) {
        userInfo.provider = userProvider.value
        parameters["provider"] = userProvider.value
        parameters["id"] = userID
        parameters["token"] = userToken
    }
    
    func save() {
        let encoder = JSONEncoder()
        guard let encodedUserInfo = try? encoder.encode(userInfo) else { return }
        UserDefaults.standard.set(encodedUserInfo, forKey: "UserInfo")
    }
    
    func load() -> Bool {
        guard let savedUserInfo = UserDefaults.standard.object(forKey: "UserInfo") as? Data else { return false }
        let decoder = JSONDecoder()
        guard let loadedUserInfo = try? decoder.decode(UserInfo.self, from: savedUserInfo) else { return false }
        userInfo = loadedUserInfo
        return true
    }
    
}
