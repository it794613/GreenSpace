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
    static func getFollowingList(request: FollowingListRequest, completion: @escaping (_ succeed: [Users]?, _ failed: Error?) -> Void) {
//        AF.request(FriendServiceTarget.followinglist, interceptor: MyRequestInterceptor()).responseData { (response) in
        AF.request(FriendServiceTarget.followinglist, interceptor: MyRequestInterceptor()).responseDecodable(of: [FollowingListResponse].self) { (response) in
                    switch response.result {
                    case .success(let response):
                        response.forEach { $0.toDomain() }
                        completion(GlobalUsers.shared.array, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
        
    }
}
