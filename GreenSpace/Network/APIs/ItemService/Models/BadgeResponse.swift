//
//  BadgeResponse.swift
//  GreenSpace
//
//  Created by su on 2022/11/23.
//

import Foundation

struct BadgeResponse: Decodable {
    let name: String
    let image: String
    let point: Int
    let category: String
}

extension BadgeResponse {
    func toDomain() {
        GlobalBadge.shared.array.append(Item(name: name, image: image, point: point, category: category))
    }
}
