//
//  Users.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation

class GlobalUsers {
    static var shared: GlobalUsers = GlobalUsers()
    
    var array: [Users] = []
}

class GlobalImage{
    static var shared: GlobalImage = GlobalImage()
    
    var imageName: String = ""
}
