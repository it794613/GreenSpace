//
//  UserRequest.swift
//  GreenSpace
//
//  Created by su on 2022/11/22.
//

import Foundation

struct UserRequest: Encodable{
    var username: String?
    var point: Int?
    var open: Bool?
    
    init(username: String) {
        self.username = username
    }
    
    init(open: Bool) {
        self.open = open
    }
}
