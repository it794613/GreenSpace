//
//  GlobalUser.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/24.
//

import Foundation
class GlobalUser{
    
    static var shared = GlobalUser()
    
    var nickname: String = ""
    var username: String = ""
    var point: Int = 0
    var open: Bool = true
    
    
}
