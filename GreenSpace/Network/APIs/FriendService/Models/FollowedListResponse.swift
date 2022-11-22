//
//  FollowedListResponse.swift
//  GreenSpace
//
//  Created by su on 2022/11/22.
//

import Foundation

struct FollowedListResponse: Decodable {
    let id: Int
    let to_user: User
}

extension FollowedListResponse {
    func toDomain() {
        GlobalFollowedUsers.shared.array.append(Users(id: id, user: to_user))
    }
}
