//
//  FriendsServiceAPI.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation
import Alamofire

struct FriendAPI {
    // TODO:  response Auth
    static func getFollowingList(completion: @escaping (_ succeed: [Users]?, _ failed: Error?) -> Void) {
        AF.request(FriendServiceTarget.followinglist, interceptor: MyRequestInterceptor()).responseDecodable(of: [FollowingListResponse].self) { (response) in
                    switch response.result {
                    case .success(let response):
                        response.forEach { $0.toDomain() }
                        completion(GlobalFollowingUsers.shared.array, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
        
    }
    
    static func getFollowedList(completion: @escaping (_ succeed: [Users]?, _ failed: Error?) -> Void) {
        AF.request(FriendServiceTarget.followedlist, interceptor: MyRequestInterceptor()).responseDecodable(of: [FollowedListResponse].self) { (response) in
                    switch response.result {
                    case .success(let response):
                        response.forEach { $0.toDomain() }
                        completion(GlobalFollowedUsers.shared.array, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
        
    }
    
    static func createFollow(request: FollowingRequest, completion: @escaping (_ succeed: Bool?, _ failed: Error?) -> Void) {
        AF.request(FriendServiceTarget.following(request), interceptor: MyRequestInterceptor()).responseDecodable(of: MessageResponse.self) { (response) in
                    switch response.result {
                    case .success:
                        completion(true, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
        
    }
    
}
