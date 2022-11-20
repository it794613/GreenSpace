//
//  UsersResponse.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation

struct UsersResponse: Decodable {
    let user_id: Int
    let username: String
    let point: Int
    let open: Bool
}

extension UsersResponse {
    var toDomain: User  {
        return User(user_id: user_id, username: username, point: point, open: open)
    }
}
