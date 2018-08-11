//
//  UIFont+.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 23..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    class var Arial: UIFont {
        return UIFont(name: "Arial-BoldMT", size: 20.0)!
    }
    
    class var tabbarText: UIFont {
        return UIFont(name: "ArialMT", size: 10.0)!
    }
    
}

extension UITextField {
    @IBInspectable var placeholderColor: UIColor {
        get {
            return attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor ?? .clear
        }
        set {
            guard let attributedPlaceholder = attributedPlaceholder else { return }
            let attributes: [NSAttributedStringKey: UIColor] = [.foregroundColor: newValue]
            self.attributedPlaceholder = NSAttributedString(string: attributedPlaceholder.string, attributes: attributes)
        }
    }
}
