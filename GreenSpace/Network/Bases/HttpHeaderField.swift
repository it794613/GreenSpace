//
//  HttpHeaderField.swift
//  GreenSpace
//
//  Created by su on 2022/11/09.
//

import Foundation
import Alamofire

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
}

enum ContentType: String {
    case json = "Application/json"
}
