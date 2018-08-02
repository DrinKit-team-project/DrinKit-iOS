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
    
    
    @IBOutlet weak var fbLoginBtn: FBSDKLoginButton!
    @IBOutlet weak var kakaoLoginBtn: KOLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fbLoginBtn.delegate = self
        removeHeightConstraintOfFBLoginBtn()
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
                                    print(me?.nickname as Any)
                                    self.performSegue(withIdentifier: "ToSettings", sender: self)
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

// MARK: - Facebook LogIn
extension LogInViewController: FBSDKLoginButtonDelegate {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if (error != nil) {
            print(error.localizedDescription)

        } else if result.isCancelled {
            print("User cancelled login.")
        } else {
//            guard let grantedPermissions = result.grantedPermissions else { return }
//            guard let declinedPermissions = result.declinedPermissions else { return }
//            guard let accessToken = result.token else { return }
//
//            print("Logged in!")
//            print("grantedPermissions = \(grantedPermissions), declinedPermissions = \(declinedPermissions), accessToken = \(accessToken.tokenString)")
//            print("FaceBook user ID = " + accessToken.userID!)
            getFBUserData()
        }

    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        //LogOut Action
    }
    
    private func getFBUserData(){
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
    
    private func removeHeightConstraintOfFBLoginBtn() {
        let layoutConstraintsArr = fbLoginBtn.constraints
        for layoutConstraint in layoutConstraintsArr {
            if ( layoutConstraint.constant == 28 ){
                layoutConstraint.isActive = false
                break
            }
        }
    }
    
}


