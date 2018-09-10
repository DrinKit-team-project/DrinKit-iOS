//
//  UploadFileResponse.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 9. 7..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

struct UploadFileRespose: Decodable {
    
    let fileDownloadUri: String
    let fileName: String
    let fileType: String
    let size: Int
    
}
