//
//  LoginResponse.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation

struct LoginResponse: Decodable {
    let access: String
    let refresh: String
}

extension LoginResponse {
    var toDomain: Auth {
        Auth.shared.access = access
        Auth.shared.refresh = refresh
        return Auth.shared
    }
}
