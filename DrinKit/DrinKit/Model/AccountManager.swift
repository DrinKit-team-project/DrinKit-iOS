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
    
    private(set) var profileImage = UIImage(named: "baseProfileImage")
    private(set) var userInfo = UserInfo()
    private(set) var parameters: [String:Any] = [:]
    
    private init() { }
    
    func setName(_ userName: String) {
        userInfo.name = userName
    }
    
    func setEmail(_ userEmail: String) {
        userInfo.email = userEmail
    }
    
    func setProfileImage(_ userProfileImage: UIImage) {
        profileImage = userProfileImage
    }
    
    func setNickName(_ userNickName: String) {
        userInfo.nickName = userNickName
    }
    
    func setIDAndJWTToken(_ userID: Int, _ userJWT: String) {
        userInfo.id = userID
        userInfo.JWTToken = userJWT
    }
    
    func setParameters(_ userProvider: Provider, _ userID: String, _ userToken: String) {
        userInfo.provider = userProvider.value
        parameters["provider"] = userProvider.value
        parameters["id"] = userID
        parameters["token"] = userToken
    }
    
    func save() {
        //Save UserInfo to UserDefaults
        let encoder = JSONEncoder()
        guard let encodedUserInfo = try? encoder.encode(userInfo) else { return }
        UserDefaults.standard.set(encodedUserInfo, forKey: "UserInfo")
        //Save ProfileImage to Cache Directory
        guard let documentDirectoryPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return }
        guard let profileImage = profileImage else { return }
        guard let data = UIImageJPEGRepresentation(profileImage, 1.0) else { return }
        let fileName = documentDirectoryPath.appendingPathComponent("profileImage.jpeg")
        try? data.write(to: fileName)
    }
    
    func load() -> Bool {
        //Load UserInfo from UserDefaults
        guard let savedUserInfo = UserDefaults.standard.object(forKey: "UserInfo") as? Data else { return false }
        let decoder = JSONDecoder()
        guard let loadedUserInfo = try? decoder.decode(UserInfo.self, from: savedUserInfo) else { return false }
        userInfo = loadedUserInfo
        //Load ProfileImage from Cache Directory
        guard let documentDirectoryPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return false }
        let fileName = documentDirectoryPath.appendingPathComponent("profileImage.jpeg")
        guard let baseProfileImage = FileManager.default.contents(atPath: fileName.path) else { return false }
        profileImage = UIImage(data: baseProfileImage)
        return true
    }
    
}
