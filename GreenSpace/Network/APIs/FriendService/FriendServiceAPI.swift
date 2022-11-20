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
        AF.request(FriendServiceTarget.followinglist, interceptor: MyRequestInterceptor())
            .responseDecodable { (response: AFDataResponse<FollowingListResponse> ) in
                    switch response.result {
                    case .success(let response):
                        print(response)
                        completion(response.toDomain, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
        
    }
}
