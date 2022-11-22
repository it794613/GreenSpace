//
//  FollowingListResponse.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation

struct FollowingListResponse: Decodable {
    let id: Int
    let to_user: User
}

extension FollowingListResponse {
    func toDomain() {
        GlobalUsers.shared.array.append(Users(id: id, user: to_user))
    }
}
