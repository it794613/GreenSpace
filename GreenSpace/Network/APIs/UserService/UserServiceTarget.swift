//
//  UserServiceTarget.swift
//  GreenSpace
//
//  Created by su on 2022/11/09.
//

import Foundation
import Alamofire

enum UserServiceTarget {
    case login(UserRequest)
    case getUserDetails(UserRequest)
}

extension UserServiceTarget: TargetType {

    var baseURL: String {
        return "https://greenspaceapi.herokuapp.com/users"
    }

    var method: HTTPMethod {
        switch self {
        case .login: return .post
        case .getUserDetails: return .get
        }
    }

    var path: String {
        switch self {
        case .login: return "/login"
        case .getUserDetails: return "/details"
        }
    }

    var parameters: RequestParams {
        switch self {
        case .login(let request): return .body(request)
        case .getUserDetails(let request): return .body(request)
        }
    }

}
