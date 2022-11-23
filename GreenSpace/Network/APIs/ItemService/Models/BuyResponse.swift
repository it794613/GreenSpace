//
//  File.swift
//  GreenSpace
//
//  Created by su on 2022/11/23.
//

import Foundation

struct BuyResponse: Decodable {
    let item: Item
    let pick: Bool
}

extension BuyResponse {
    func toDomain(to target: String) {
        if target == "Other" {
            GlobalBuy.shared.otherArray.append(Buy(item: item, pick: pick))
        }
        else {
            GlobalBuy.shared.array.append(Buy(item: item, pick: pick))
        }
    }
}
