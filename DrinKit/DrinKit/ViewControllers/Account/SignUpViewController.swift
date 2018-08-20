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
        print(UserInfo.sharedInstance.parameters)
//        Alamofire.request(
//            "http://ec2-13-125-230-80.ap-northeast-2.compute.amazonaws.com:8080/social",
//            method: .post ,
//            parameters: UserInfo.sharedInstance.parameters,
//            encoding: JSONEncoding.default,
//            headers: ["Content-Type":"application/json"])
//            .responseJSON { (response) in
//                guard let data = response.result.value as? [String:Any] else { return }
//                guard let userJWT = data["token"] as? String else { return }
//                UserInfo.sharedInstance.setJWTToken(userJWT)
//                print(UserInfo.sharedInstance.JWTToken)
//                print(UserInfo.sharedInstance)
//        }
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
