//
//  GlobalBuy.swift
//  GreenSpace
//
//  Created by su on 2022/11/23.
//

import Foundation

class GlobalBuy {
    static var shared: GlobalBuy = GlobalBuy()
    
    var array: [Buy] = []
    var otherArray: [Buy] = []
}
