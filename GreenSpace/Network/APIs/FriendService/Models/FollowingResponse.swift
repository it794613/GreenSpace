//
//  FollowingResponse.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation

struct FollowingResponse: Decodable {
    let message: String
}

extension FollowingResponse {
    var toDomain: NoResponse {
        return NoResponse(message: message)
    }
}
