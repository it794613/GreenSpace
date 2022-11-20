//
//  User.swift
//  GreenSpace
//
//  Created by su on 2022/11/09.
//

import Foundation

struct User: Decodable {
    let user_id: Int
    let username: String
    let point: Int
    let open: Bool
}
