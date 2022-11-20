//
//  UserServiceAPI.swift
//  GreenSpace
//
//  Created by su on 2022/11/09.
//

import Foundation
import Alamofire

struct LoginAPI {
    // TODO:  response Auth
    static func login(request: UserRequest, completion: @escaping (_ succeed: Auth?, _ failed: Error?) -> Void) {
        AF.request(UserServiceTarget.login(request))
            .responseDecodable { (response: AFDataResponse<LoginResponse>) in
                switch response.result {
                case .success(let response):
                    completion(response.toDomain, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    // TODO:  response User
    static func register(request: UserRequest, completion: @escaping (_ succeed: User?, _ failed: Error?) -> Void) {
        AF.request(UserServiceTarget.login(request), interceptor: MyRequestInterceptor())
            .responseDecodable { (response: AFDataResponse<UserResponse>) in
                switch response.result {
                case .success(let response):
                    completion(response.toDomain, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    // TODO:  response ??
    static func unregister(request: UserRequest, completion: @escaping (_ succeed: User?, _ failed: Error?) -> Void) {
        AF.request(UserServiceTarget.login(request), interceptor: MyRequestInterceptor())
            .responseDecodable { (response: AFDataResponse<UserResponse>) in
                switch response.result {
                case .success(let response):
                    completion(response.toDomain, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    // TODO:  response ??
    static func update(request: UserRequest, completion: @escaping (_ succeed: User?, _ failed: Error?) -> Void) {
        AF.request(UserServiceTarget.login(request), interceptor: MyRequestInterceptor())
            .responseDecodable { (response: AFDataResponse<UserResponse>) in
                switch response.result {
                case .success(let response):
                    completion(response.toDomain, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    // TODO:  response ??
    static func getBuyByUser(request: UserRequest, completion: @escaping (_ succeed: User?, _ failed: Error?) -> Void) {
        AF.request(UserServiceTarget.login(request), interceptor: MyRequestInterceptor())
            .responseDecodable { (response: AFDataResponse<UserResponse>) in
                switch response.result {
                case .success(let response):
                    completion(response.toDomain, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    // TODO:  response User[]
    static func getAllUser(request: UserRequest, completion: @escaping (_ succeed: User?, _ failed: Error?) -> Void) {
        AF.request(UserServiceTarget.login(request), interceptor: MyRequestInterceptor())
            .responseDecodable { (response: AFDataResponse<UserResponse>) in
                switch response.result {
                case .success(let response):
                    completion(response.toDomain, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    // TODO:  response ??
    static func updateBuyByUser(request: UserRequest, completion: @escaping (_ succeed: User?, _ failed: Error?) -> Void) {
        AF.request(UserServiceTarget.login(request), interceptor: MyRequestInterceptor())
            .responseDecodable { (response: AFDataResponse<UserResponse>) in
                switch response.result {
                case .success(let response):
                    completion(response.toDomain, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
}
