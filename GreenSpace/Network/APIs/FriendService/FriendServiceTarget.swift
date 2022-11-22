//
//  FriendServiceTarget.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation
import Alamofire

enum FriendServiceTarget {
    case followinglist
    case followedlist
    case following(FollowingRequest)
}

extension FriendServiceTarget: TargetType {
    
    var baseURL: String {
        return "https://greenspaceapi.herokuapp.com/users"
    }
    
    var method: HTTPMethod {
        switch self {
        case .followinglist: return .get
        case .followedlist: return .get
        case .following: return .post
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
