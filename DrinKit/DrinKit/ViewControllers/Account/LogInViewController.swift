//
//  LogInViewController.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 26..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class LogInViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = FBSDKLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
        
        //        if let accessToken = FBSDKAccessToken.current() {
        //            getFBUserData()
        //        }
        
    }
    
    @objc func loginFacebook(_ sender: UIButton){
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self){ (result, error) in
            if (error == nil) {
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                }
            }
        }
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    //everything works print the user data
                    print(result as Any)
                    self.performSegue(withIdentifier: "ToSettings", sender: self)
                }
            })
        }
    }
    
    @IBAction func loginKakao(_ sender: KOLoginButton) {
        let session = KOSession.shared()
        
                if let session = session {
                    if session.isOpen() {
                        session.close()
                    }
        
                    session.open { (error) in
                        if error == nil {
                            print("No Error")
                            if session.isOpen() {
                                print("Success")
                                KOSessionTask.userMeTask(completion: { (error, me) in
                                    print(me?.nickname)
                                    
                                })
                            } else {
                                print("fail")
                            }
                        } else {
                            print(error?.localizedDescription ?? "")
                        }
        
                    }
                } else {
                    print("Something Wrong")
                }
        
            }
    
}


