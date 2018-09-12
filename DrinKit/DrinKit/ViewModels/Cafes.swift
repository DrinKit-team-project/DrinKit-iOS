//
//  Cafes.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 8. 24..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation
import Alamofire

class Cafes {
    
    var allCafes = [Cafe]()
    var count: Int {
        return allCafes.count
    }
    subscript(index : Int) -> Cafe {
        return allCafes[index]
    }
    
    init() {
        NetworkManager.shared.request(
            urlString: "http://ec2-13-125-68-133.ap-northeast-2.compute.amazonaws.com:8080/api/cafes",
            targetType: [Cafe].self) { [weak self] (model: [Cafe]?) in
            guard let `self` = self else { return }
            guard let model = model else { return }
            self.allCafes = model
        }
    }
    
}
