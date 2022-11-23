//
//  ProductServiceAPI.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation
import Alamofire

struct ProductAPI {
    static func getAllProduct(completion: @escaping (_ succeed: [Product]?, _ failed: Error?) -> Void) {
        AF.request(ProductServiceTarget.all, interceptor: MyRequestInterceptor())
            .responseDecodable(of: [ProductResponse].self) { (response) in
                    switch response.result {
                    case .success(let response):
                        response.forEach { $0.toDomain() }
                        completion(GlobalProducts.shared.array, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
    }
    
    static func updateBookmark(request: BookmarkRequest,completion: @escaping (_ succeed: Bool?, _ failed: Error?) -> Void) {
        AF.request(ProductServiceTarget.updateBookmark(request), interceptor: MyRequestInterceptor())
            .responseDecodable(of: MessageResponse.self) { (response) in
                    switch response.result {
                    case .success:
                        completion(true, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
    }
    
    static func getAllBookmark(completion: @escaping (_ succeed: [Bookmark]?, _ failed: Error?) -> Void) {
        AF.request(ProductServiceTarget.getBookmark, interceptor: MyRequestInterceptor())
            .responseDecodable(of: [BookmarkResponse].self) { (response) in
                    switch response.result {
                    case .success(let response):
                        response.forEach { $0.toDomain() }
                        completion(GlobalBookmark.shared.array, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
    }
}
