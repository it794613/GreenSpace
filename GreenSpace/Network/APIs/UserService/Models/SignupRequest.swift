//
//  SignupRequest.swift
//  GreenSpace
//
//  Created by su on 2022/11/22.
//

import Foundation

struct SignupRequest: Encodable {
    let nickname: String
    let username: String
    let password: String
}
