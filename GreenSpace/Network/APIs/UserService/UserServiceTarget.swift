//
//  UserServiceTarget.swift
//  GreenSpace
//
//  Created by su on 2022/11/09.
//

import Foundation
import Alamofire

enum UserServiceTarget {
    case signin(SigninRequest)
    case signup(SignupRequest)
    case profile                // auth
    case delete
    case update(UserRequest)
}

extension UserServiceTarget: TargetType {

    var baseURL: String {
        return "https://greenspaceapi.herokuapp.com/users"
    }

    var method: HTTPMethod {
        switch self {
        case .signin: return .post
        case .signup: return .post
        case .profile: return .get
        case .delete: return .delete
        case .update: return .patch
        }
    }

    var path: String {
        switch self {
        case .signin: return "/signin/"
        case .signup: return "/signup/"
        case .profile, .update: return "/profile/"
        case .delete: return "/delete/"
            
        }
    }

    var parameters: RequestParams? {
        switch self {
        case .signin(let request): return .body(request)
        case .signup(let request): return .body(request)
        case .profile: return nil
        case .delete: return nil
        case .update(let request): return .body(request)
        }
    }

}
