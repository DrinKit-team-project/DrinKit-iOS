//
//  Review.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 8. 24..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

struct Review: Decodable {
    
    let contents: String
    let delted: Bool
    let id: Int
    let menu: Menu
    let ratings: Double
    let uploadFileResponse: UploadFileRespose
    let writer: Writer
    
}

