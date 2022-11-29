//
//  UserServiceAPI.swift
//  GreenSpace
//
//  Created by su on 2022/11/09.
//

import Foundation
import Alamofire

struct LoginAPI {
    //로그인
    static func signin(request: SigninRequest, completion: @escaping (_ succeed: Auth?, _ failed: Error?) -> Void) {
        AF.request(UserServiceTarget.signin(request))
            .responseDecodable { (response: AFDataResponse<LoginResponse>) in
                switch response.result {
                case .success(let response):
                    completion(response.toDomain, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    //회원가입
    static func signup(request: SignupRequest, completion: @escaping (_ succeed: Bool?, _ failed: Error?) -> Void) {
        AF.request(UserServiceTarget.signup(request))
            .responseData { (response) in
                switch response.result{
                case.success(let response):
                    completion(true,nil)
                case.failure(let error):
                    completion(nil, error)
                }
            }
    }
//    static func signup(request: SignupRequest, completion: @escaping (_ succeed: Bool?, _ failed: Error?) -> Void) {
//        AF.request(UserServiceTarget.signup(request))
//            .responseDecodable { (response: AFDataResponse<SignupResponse>) in
//                switch response.result {
//                case .success(let response):
//                    completion(true, nil)
//                case .failure(let error):
//                    completion(nil, error)
//                }
//            }
//    }
    
    static func profile(completion: @escaping (_ succeed: User?, _ failed: Error?) -> Void) {
        AF.request(UserServiceTarget.profile, interceptor: MyRequestInterceptor())
            .responseDecodable { (response: AFDataResponse<UserResponse>) in
                switch response.result {
                case .success(let response):
                    completion(response.toDomain, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    
    static func delete(completion: @escaping (_ succeed: Bool?, _ failed: Error?) -> Void) {
        AF.request(UserServiceTarget.delete, interceptor: MyRequestInterceptor())
            .responseDecodable { (response: AFDataResponse<EmptyResponse>) in
                switch response.result {
                case .success(let response):
                    completion(true, nil)
                    print(response)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    static func update(request: UserRequest, completion: @escaping (_ succeed: User?, _ failed: Error?) -> Void) {
        AF.request(UserServiceTarget.update(request), interceptor: MyRequestInterceptor())
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
