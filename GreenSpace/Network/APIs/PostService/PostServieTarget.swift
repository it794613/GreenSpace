//
//  PostServieTarget.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation

enum PostServiceTarget {
    case get
    case patch
    case delete
    case post
}

extension PostServiceTarget: TargetType {
    
    var baseURL: String {
        return "https://greenspaceapi.herokuapp.com/media/post"
    }
    
    var method: HTTPMethod {
        switch self {
        case .get: return .get
        case .patch: return .get
        case .delete: return .post
        case .post: return .post
        }
    }
    
    var path: String {
        switch self {
        case .followinglist: return "/followinglist/"
        case .followedlist: return "/followedlist/"
        case .following: return "/following/"
        }
    }
    
    var parameters: RequestParams? {
        switch self {
        case .followinglist: return nil
        case .followedlist: return nil
        case .following(let request): return .body(request)
        }
    }

}
