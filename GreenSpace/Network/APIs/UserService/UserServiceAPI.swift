//
//  UserServiceAPI.swift
//  GreenSpace
//
//  Created by su on 2022/11/09.
//

import Foundation
import Alamofire

struct LoginAPI {
    /// 이름과 패스워드로 로그인
    static func login(request: UserRequest, completion: @escaping (_ succeed: User?, _ failed: Error?) -> Void) {
        AF.request(UserServiceTarget.login(request))
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
