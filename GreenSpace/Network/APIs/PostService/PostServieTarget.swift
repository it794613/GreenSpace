//
//  PostServieTarget.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation
import Alamofire

enum PostServiceTarget {
    case get
    case patch(PostRequest)
    case delete(PostRequest)
    case post(PostRequest)
}

extension PostServiceTarget: TargetType {
    
    var baseURL: String {
        return "https://greenspaceapi.herokuapp.com/post"
    }
    
    var method: HTTPMethod {
        switch self {
        case .get: return .get
        case .patch: return .patch
        case .delete: return .delete
        case .post: return .post
        }
    }
    
    var path: String {
        switch self {
        case .get : return "/"
        case .patch(let response): return "/\(response.id)/"
        case .delete(let response): return "/\(response.id)/"
        case .post: return "/"
        }
    }
    
    var parameters: RequestParams? {
        switch self {
        case .get: return nil
        case .patch: return nil
        case .delete: return nil
        case .post(let request): return .body(request)
        }
    }

}
