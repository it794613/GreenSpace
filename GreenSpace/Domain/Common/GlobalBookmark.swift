//
//  GlobalBookmark.swift
//  GreenSpace
//
//  Created by su on 2022/11/23.
//

import Foundation

class GlobalBookmark {
    static var shared: GlobalBookmark = GlobalBookmark()
    
    var array: [Bookmark] = []
}
