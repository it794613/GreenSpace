//
//  ProductResponse.swift
//  GreenSpace
//
//  Created by su on 2022/11/23.
//

import Foundation

struct ProductResponse: Decodable {
    let id: Int
    let name: String
    let company: String
    let product_no: Int
    let purpose: String
}

extension ProductResponse {
    func toDomain()  {
        GlobalProducts.shared.array.append(Product(id: id, name: name, company: company, product_no: product_no, purpose: purpose))
    }
}
