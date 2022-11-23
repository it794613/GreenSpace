//
//  Item.swift
//  GreenSpace
//
//  Created by su on 2022/11/23.
//

import Foundation

struct Item: Decodable {
    let name: String
    let image: String
    let point: Int
    let category: String
}
