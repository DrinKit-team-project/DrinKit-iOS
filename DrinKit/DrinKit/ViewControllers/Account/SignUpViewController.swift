//
//  SignUpViewController.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 26..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var editingProfileImgBtn: UIButton!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nicknameTextField.delegate = self
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
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
