//
//  PostServiceAPI.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation
import Alamofire


struct PostServiceAPI{
    static func get(completion: @escaping (_ succeed: [Post]?, _ failed: Error?) -> Void) {
        AF.request(PostServiceTarget.get, interceptor: MyRequestInterceptor()).responseDecodable(of: [PostServiceResponse].self) { (response) in
                    switch response.result {
                    case .success(let response):
                        GlobalPost.shared.array = []
                        response.forEach { $0.toDomain() }
                        completion(GlobalPost.shared.array, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
        }
    
    static func delete(request: PostRequest, completion: @escaping (_ succeed: Bool?, _ failed: Error?) -> Void) {
        AF.request(PostServiceTarget.delete(request), interceptor: MyRequestInterceptor()).responseDecodable(of: PostDeleteResponse.self) { (response) in
                    switch response.result {
                    case .success(let response):
                        print(response)
                        completion(true, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
        }
//
    static func post(request: PostRequest, completion: @escaping (_ succeed: Bool?, _ failed: Error?) -> Void) {
        AF.request(PostServiceTarget.patch(request), interceptor: MyRequestInterceptor()).responseDecodable(of: PostPostResponse.self) { (response) in
                    switch response.result {
                    case .success(let response):
                        print(response)
                        completion(true, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
        }
    
    static func patch(request: PostRequest, completion: @escaping (_ succeed: Bool?, _ failed: Error?) -> Void) {
        AF.request(PostServiceTarget.patch(request), interceptor: MyRequestInterceptor()).responseDecodable(of: PostServiceResponse.self) { (response) in
                    switch response.result {
                    case .success(let response):
                        print(response)
                        completion(true, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
        }
    
}
