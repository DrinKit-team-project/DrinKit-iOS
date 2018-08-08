//
//  SignUpViewController.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 26..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Alamofire

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var editingProfileImgBtn: UIButton!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nicknameTextField.delegate = self
        nicknameTextField.addTarget(self, action: #selector(changeStatusOfSignUpButton), for: .editingChanged)
        setBasicInfoTexts()
    }
    
    @objc func changeStatusOfSignUpButton() {
        if nicknameTextField.hasText {
            signUpBtn.isEnabled = true
            return
        }
        signUpBtn.isEnabled = false
    }
    
    private func setBasicInfoTexts() {
        let userBasicInfo = UserInfo.sharedInstance
        profileImage.image = userBasicInfo.profileImage
        userNameLabel.text = userBasicInfo.name
        userEmailLabel.text = userBasicInfo.email
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func signUpBtnTouched(_ sender: UIButton) {
        guard let userNickname = nicknameTextField.text else { return }
        UserInfo.sharedInstance.setNickName(userNickname)
        switch UserInfo.sharedInstance.provider {
        case .FACEBOOK:
            guard let currentSession = FBSDKAccessToken.current() else { return }
            let parameters: [String:Any] = [
                "provider": UserInfo.sharedInstance.provider.value,
                "id": currentSession.userID,
                "token": currentSession.tokenString,
                ]
            Alamofire.request(
                "ec2-13-125-126-150.ap-northeast-2.compute.amazonaws.com/social",
                method: .post,
                parameters: parameters,
                encoding: URLEncoding.default,
                headers: ["Content-Type":"application/json"]).responseJSON { (response) in
                    guard let data = response.result.value as? [String:Any] else { return }
                    guard let userJWT = data["token"] as? String else { return }
                    UserInfo.sharedInstance.setJWTToken(userJWT)
            }
        case .KAKAO:
            guard let currentSession = KOSession.shared().token else { return }
            let parameters: [String:Any] = [
                "provider": UserInfo.sharedInstance.provider.value,
                "token": currentSession.accessToken,
                ]
            Alamofire.request(
                "ec2-13-125-126-150.ap-northeast-2.compute.amazonaws.com/social",
                method: .post,
                parameters: parameters,
                encoding: URLEncoding.default,
                headers: ["Content-Type":"application/json"])
                .responseJSON { (response) in
                    guard let data = response.result.value as? [String:Any] else { return }
                    guard let userJWT = data["token"] as? String else { return }
                    UserInfo.sharedInstance.setJWTToken(userJWT)
                    print(UserInfo.sharedInstance.JWTToken)
            }
        default: break
        }
        guard let homeTabbarController = storyboard?.instantiateViewController(withIdentifier: "Main") as? UITabBarController else { return }
        self.present(homeTabbarController, animated: true, completion: nil)
    }
    
}


// MARK: - Edit Profile Image
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func editingProfileImgBtnTouched(sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.profileImage.image = image
            dismiss(animated: true, completion: nil)
        }
    }
    
}
