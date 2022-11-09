//
//  UserResponse.swift
//  GreenSpace
//
//  Created by su on 2022/11/09.
//

import Foundation

struct UserResponse: Decodable {
    let user_id: Int
    let username: String
    let point: Int
    let open: Bool
}

extension UserResponse {
    var toDomain: User {
        return User(user_id: user_id, username: username, point: point, open: open)
    }
}
