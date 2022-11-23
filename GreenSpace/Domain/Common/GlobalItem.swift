//
//  GlobalItem.swift
//  GreenSpace
//
//  Created by su on 2022/11/23.
//

import Foundation

class GlobalItem {
    static var shared: GlobalItem = GlobalItem()
    
    var array: [Item] = []
}
