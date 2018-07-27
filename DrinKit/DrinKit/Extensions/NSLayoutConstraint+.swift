//
//  NSLayoutConstraint+.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 27..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    
    override open var description: String {
        let id = identifier ?? ""
        return "id: \(id), constant: \(constant)" //you may print whatever you want here
    }
    
}
