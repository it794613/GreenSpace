//
//  Product.swift
//  GreenSpace
//
//  Created by su on 2022/11/23.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let name: String
    let company: String
    let product_no: Int
    let purpose: String
}
