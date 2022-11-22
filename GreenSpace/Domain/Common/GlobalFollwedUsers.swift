//
//  GlobalFollwedUsers.swift
//  GreenSpace
//
//  Created by su on 2022/11/22.
//

import Foundation

class GlobalFollowedUsers {
    static var shared: GlobalFollowedUsers = GlobalFollowedUsers()
    
    var array: [Users] = []
}

