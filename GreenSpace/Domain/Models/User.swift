//
//  User.swift
//  GreenSpace
//
//  Created by su on 2022/11/09.
//

import Foundation

struct User: Decodable {
    let nickname: String
    let username: String
    let point: Int
    let open: Bool
}
