//
//  MyDrinkViewController.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 26..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyDrinkViewController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editingProfileImgBtn: UIButton!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var editingNicknameBtn: UIButton!
    @IBOutlet var tapGestureForDismissingKeyboard: UITapGestureRecognizer!

    private lazy var bottomLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.white.cgColor
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonBar()
        setBasicInfoTexts()
        nicknameTextField.addTarget(self,
                                    action: #selector(addBottomLineToNicknameTextField),
                                    for: [.editingChanged, .editingDidEnd])
        nicknameTextField.layer.addSublayer(bottomLayer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addBottomLineToNicknameTextField()
    }
    
    private func setBasicInfoTexts() {
        let userBasicInfo = AccountManager.sharedInstance
        profileImageView.image = userBasicInfo.profileImage
        nicknameTextField.text = AccountManager.sharedInstance.userInfo.nickName
    }
    
    @objc private func addBottomLineToNicknameTextField() {
        bottomLayer.frame.origin = CGPoint(x: 0, y: nicknameTextField.frame.height - 1)
        bottomLayer.frame.size = CGSize(width: nicknameTextField.frame.width, height: 1)
    }
    
    @IBAction func editingNicknameBtnTouched(_ sender: UIButton) {
        nicknameTextField.isUserInteractionEnabled = true
        nicknameTextField.becomeFirstResponder()
        tapGestureForDismissingKeyboard.isEnabled = true
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        nicknameTextField.isUserInteractionEnabled = false
        AccountManager.sharedInstance.setNickName(nicknameTextField.text ?? "")
        AccountManager.sharedInstance.save()
        tapGestureForDismissingKeyboard.isEnabled = false
    }
    
    // MARK: - ButtonBarPagerTabStripView
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let MyDrinkListVC = UIStoryboard(name: "MyDrinkTab", bundle: nil).instantiateViewController(withIdentifier: "MyDrinkList")
        let MyReviewListVC = UIStoryboard(name: "MyDrinkTab", bundle: nil).instantiateViewController(withIdentifier: "MyReviewList")
        return [MyDrinkListVC, MyReviewListVC]
    }
    
    private func setButtonBar() {
        settings.style.buttonBarItemBackgroundColor = UIColor.init(named: "ButtonBarBackground")!
        settings.style.buttonBarItemFont = UIFont.init(name: "NotoSansKR-Medium", size: 16)!
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?,newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            newCell?.alpha = 1.0
            oldCell?.alpha = 0.5
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                newCell?.label.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.label.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            })
        }
    }
}

// MARK: - Edit profile Image
extension MyDrinkViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func editingProfileImgBtnTouched(sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.profileImageView.image = image
            AccountManager.sharedInstance.setProfileImage(image)
            dismiss(animated: true, completion: nil)
        }
    }
}
