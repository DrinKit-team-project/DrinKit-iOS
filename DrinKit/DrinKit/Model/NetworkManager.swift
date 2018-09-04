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
