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
        Alamofire.request("").responseJSON { (response) in
            guard let data = response.data else { return }
            self.allCafes = self.decode(data)
        }
    }
    
    private func decode(_ data : Data) -> [Cafe] {
        do {
            return try JSONDecoder().decode([Cafe].self, from : data)
        } catch {
            return []
        }
    }
    
}
