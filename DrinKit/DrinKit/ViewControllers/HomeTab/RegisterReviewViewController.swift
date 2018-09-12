//
//  RegisterReviewViewController.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 9. 6..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit
import Cosmos
import Alamofire

class RegisterReviewViewController: UIViewController{
    
    @IBOutlet weak var reviewImageView: UIImageView!
    @IBOutlet weak var starRatingBackgroundView: UIView!
    @IBOutlet weak var reviewTextView: UITextView!
    @IBOutlet weak var reviewTextViewBottomConstraint: NSLayoutConstraint!
    private let starRatingView = StarRatingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
        setStarRatingView()
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo? [UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        let keyboardHeight = keyboardSize?.height
        
        if #available(iOS 11.0, *) {
            self.reviewTextViewBottomConstraint.constant = keyboardHeight! - view.safeAreaInsets.bottom + 10
        } else {
            self.reviewTextViewBottomConstraint.constant = view.safeAreaInsets.bottom
        }
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        self.reviewTextViewBottomConstraint.constant =  10
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func setStarRatingView() {
        starRatingBackgroundView.addSubview(starRatingView)
        starRatingView.setColors(textColor: .white, backgroundColor: UIColor(named: "Background")!)
        starRatingView.setSizeConstraints(width: 181, height: 30)
        starRatingView.setStarSize(30)
        starRatingBackgroundView.snp.makeConstraints { (make) in
            make.centerX.equalTo(starRatingView.snp.centerX)
            make.centerY.equalTo(starRatingView.snp.centerY)
        }
    }
    
    @IBAction func cancelButtonTouched(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButtonTouched(_ sender: UIBarButtonItem) {
        NetworkManager.shared.updateReview(
            menuId: 1,
            ratings: starRatingView.rating,
            contents: reviewTextView.text,
            image: reviewImageView.image) { review in
            print(review)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension RegisterReviewViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func reviewImageButtonTouched(_ sender: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.reviewImageView.image = image
            dismiss(animated: true, completion: nil)
        }
    }
    
}
