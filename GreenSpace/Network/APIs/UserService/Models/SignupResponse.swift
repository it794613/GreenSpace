//
//  SignupResponse.swift
//  GreenSpace
//
//  Created by su on 2022/11/22.
//

import Foundation

struct _User: Decodable {
    let user_id: Int
    let last_login: Bool
    let is_superuser: Bool
    let username, nickname, create_dt: String
    let open: Bool
    let point: Int
    let is_staff, is_active: Bool
    let groups, user_permissions: [String?]
}

struct SignupResponse: Decodable {
    let user: _User
    let message: String
}

extension SignupResponse {
//    var toDomain: User {
//        return User(nickname: nickname, username: username, point: point, open: open)
//    }
}
