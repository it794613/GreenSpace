//
//  ItemResponse.swift
//  GreenSpace
//
//  Created by su on 2022/11/23.
//

import Foundation

struct ItemResponse: Decodable {
    let name: String
    let image: String
    let point: Int
    let category: String
}

extension ItemResponse {
    func toDomain() {
        GlobalItem.shared.array.append(Item(name: name, image: image, point: point, category: category))
    }
}
