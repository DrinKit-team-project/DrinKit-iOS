//
//  NetworkManager.swift
//  DrinKit
//
//  Created by JakeLEE on 2018. 9. 1..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher

class NetworkManager {
    static let shared: NetworkManager = NetworkManager()

    private init() {}

    func request<T: Decodable>(urlString: String, targetType: T.Type, completion: @escaping (T?) -> ()) {
        Alamofire.request(urlString)
            .responseData { [weak self] responseData in
                guard let `self` = self else { return }
                switch responseData.result {
                case .success(let data):
                    guard let model = self.decode(data, type: T.self) else { return }
                    completion(model)
                case .failure(_):
                    completion(nil)
                    // 해당 데이터가 없습니다. or image
                }
        }
    }
    // 똑같.
    func updateReview(menuId: Int, ratings: Double, contents: String, image: UIImage?, completion: @escaping (Review?) -> ()) {
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append("\(menuId)".data(using: String.Encoding.utf8)!, withName: "menuId")
                multipartFormData.append("\(ratings)".data(using: String.Encoding.utf8)!, withName: "ratings")
                multipartFormData.append("\(contents)".data(using: String.Encoding.utf8)!, withName: "contents")
                if let reviewImage = image, let imageData = UIImageJPEGRepresentation(reviewImage, 1) {
                    multipartFormData.append(imageData, withName: "reviewImage", fileName: "reviewImage.jpeg", mimeType: "image/jpeg")
                }
        },
            usingThreshold: UInt64.init(),
            to: "http://ec2-13-125-68-133.ap-northeast-2.compute.amazonaws.com:8080/api/menus/\(menuId)/reviews",
            method: .post,
            headers: ["Content-Type": "application/json",
                      "Authorization": AccountManager.sharedInstance.JWTToken]
        ) { encodingResult in
            switch encodingResult {
            case .success(request: let upload, streamingFromDisk: _ , streamFileURL: _ ):
//                                upload.responseData(completionHandler: { responseData in
//                                    switch responseData.result {
//                                    case .success(let data):
//                                        guard let review = self.decode(data, type: Review.self) else { return }
//                                        completion(review)
//                                        //등록 완료 메세지
//                                    case .failure(_):
//                                        completion(nil)
//                                    }
//                                })
                upload.responseJSON(completionHandler: { (response) in
                    guard let value = response.result.value as? [String:Any] else { return }
                    guard let message = value["message"] as? String else { return }
                    print(message)
                })
            case .failure(let encodingError): print("error : \(encodingError)")
            }
        }
    }
    
    private func decode<T: Decodable> (_ data : Data, type: T.Type) -> T? {
        return try? JSONDecoder().decode(T.self, from : data)
    }

    func downloadImage(urlString: String, imageView: UIImageView, completion: @escaping ()->()) {
        guard let url = URL(string: urlString) else { return }
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url) { [imageView]
            (image, error, cacheType, imageUrl) in
            if image == nil, error != nil {
                imageView.backgroundColor = UIColor.gray
            } else {
                imageView.image = image
            }
            completion()
        }
    }

}
