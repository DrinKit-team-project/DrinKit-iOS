//
//  LogInViewController.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 26..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit
//import FBSDKCoreKit
import FBSDKLoginKit

class LogInViewController: UIViewController {
    
    
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var fbLoginBtn: FBSDKLoginButton!
    @IBOutlet weak var kakaoLoginBtn: KOLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fbLoginBtn.delegate = self
        removeHeightConstraintOfFBLoginBtn()
        if FBSDKAccessToken.currentAccessTokenIsActive() {
            FBSDKLoginManager().logOut()
        }
        logoView.layer.borderWidth = 3
        logoView.layer.borderColor = UIColor.white.cgColor
    }
     
}

// MARK: - Facebook LogIn
extension LogInViewController: FBSDKLoginButtonDelegate {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if (error != nil) {
            print(error.localizedDescription)
        } else if result.isCancelled {
            print("User cancelled login.")
        } else {
            getFBUserData()
        }
        
    }
    
    private func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil) {
            guard let request = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]) else { return }
            request.start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil) {
                    guard let result = result as? [String:Any] else { return }
//                    guard let url = ((result["picture"] as? [String:Any])?["data"] as? [String:Any])?["url"] as? String else { return }
//                    guard let imageURL = URL(string: url),
//                          let imageData = try? Data(contentsOf: imageURL) else { return }
//                    guard let userProfileImg = UIImage(data: imageData),
                    guard
                          let userName = result["name"] as? String,
                          let userEmail = result["email"] as? String else { return }
                    guard let session = FBSDKAccessToken.current() else { return }
                    UserInfo.sharedInstance.setBasicInformation(userName, userEmail)
                    UserInfo.sharedInstance.setParameters(.FACEBOOK, session.userID, session.tokenString)
                    self.performSegue(withIdentifier: "ToSettings", sender: self)
                }
            })
        }
    }
    
    private func removeHeightConstraintOfFBLoginBtn() {
        let layoutConstraintsArr = fbLoginBtn.constraints
        for layoutConstraint in layoutConstraintsArr {
            if ( layoutConstraint.constant == 28 ){
                layoutConstraint.isActive = false
                break
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        //LogOut Action
    }
    
}

// MARK: - Kakao Login
extension LogInViewController {
    
    @IBAction func loginKakao(_ sender: KOLoginButton) {
        guard let session = KOSession.shared() else { return }
        if session.isOpen() {
            session.close()
        }
        session.presentingViewController = self
        session.open { (error) in
            guard error == nil else { print(error?.localizedDescription ?? ""); return }
            if session.isOpen() {
                print("Success")
                KOSessionTask.userMeTask(completion: { (error, me) in
                    guard let user = me else { return }
                    guard let userName = user.nickname,
                          let userEmail = user.account?.email,
                          let userID = user.id else { return }
                    UserInfo.sharedInstance.setBasicInformation(userName, userEmail)
                    UserInfo.sharedInstance.setParameters(.KAKAO, userID, session.token.accessToken)
                    self.performSegue(withIdentifier: "ToSettings", sender: self)
                })
            } else {
                print("fail: "  + (error?.localizedDescription ?? ""))
            }
        }
    }
    
}
