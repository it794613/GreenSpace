//
//  UserRequest.swift
//  GreenSpace
//
//  Created by su on 2022/11/09.
//

import Foundation

struct SigninRequest: Encodable {
    let nickname: String
    let password: String
}
