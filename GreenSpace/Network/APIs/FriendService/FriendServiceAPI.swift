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
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Auth.shared.access!)",
            "Content-Type": "application/json"
        ]
        AF.request("https://greenspaceapi.herokuapp.com/users/followinglist", method: .get, parameters: nil, headers: headers)
            .validate().responseData { (response) in
                    switch response.result {
                    case .success(let response):
                        print(response)
                        let sodeul = try? JSONDecoder().decode([FollowingListResponse].self, from: response)
                        debugPrint(sodeul)
                        let jsonString:String = String.init(data: response, encoding: .utf8) ?? "err"
                        print(jsonString)
                            
                        
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
        
    }
}
