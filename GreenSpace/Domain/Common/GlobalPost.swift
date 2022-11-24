//
//  GlobalPost.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/23.
//

import Foundation

class GlobalPost{
    static var shared = GlobalPost()
    
    var array : [Post] = []
}
