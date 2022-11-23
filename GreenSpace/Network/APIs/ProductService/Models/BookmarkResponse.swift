//
//  BookmarkResponse.swift
//  GreenSpace
//
//  Created by su on 2022/11/23.
//

import Foundation

struct BookmarkResponse: Decodable {
    let id: Int
    let product: Product
}

extension BookmarkResponse {
    func toDomain() {
        GlobalBookmark.shared.array.append(Bookmark(id: id, product: product))
    }
}
