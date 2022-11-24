//
//  Auth.swift
//  GreenSpace
//
//  Created by su on 2022/11/09.
//

import Foundation

class Auth {
    static let shared = Auth()
    
    var access: String?
    var refresh: String?
    
    private init() {}
    
    func clear(){
        self.access = ""
        self.refresh = ""
    }
    
}

