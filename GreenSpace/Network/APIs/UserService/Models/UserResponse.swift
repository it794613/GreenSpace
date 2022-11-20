//
//  UserResponse.swift
//  GreenSpace
//
//  Created by su on 2022/11/09.
//

import Foundation

struct UserResponse: Decodable {
    let nickname: String
    let username: String
    let point: Int
    let open: Bool
}

extension UserResponse {
    var toDomain: User {
        return User(nickname: nickname, username: username, point: point, open: open)
    }
}
