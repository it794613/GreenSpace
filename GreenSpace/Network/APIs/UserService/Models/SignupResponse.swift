//
//  SignupResponse.swift
//  GreenSpace
//
//  Created by su on 2022/11/22.
//

import Foundation

struct _User: Decodable {
    let userID: Int
    let lastLogin: Bool
    let isSuperuser: Bool
    let username, nickname, createDt: String
    let userOpen: Bool
    let point: Int
    let isStaff, isActive: Bool
    let groups, userPermissions: [String?]
}

struct SignupResponse: Decodable {
    let _user: _User
    let message: String
}

extension SignupResponse {
//    var toDomain: User {
//        return User(nickname: nickname, username: username, point: point, open: open)
//    }
}
