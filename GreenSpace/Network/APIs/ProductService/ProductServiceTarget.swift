//
//  ProductServiceTarget.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation
import Alamofire

enum ProductServiceTarget {
    case all
    case updateBookmark(BookmarkRequest)
    case getBookmark
}

extension ProductServiceTarget: TargetType {
    
    var baseURL: String {
        return "https://greenspaceapi.herokuapp.com/products"
    }
    
    var method: HTTPMethod {
        switch self {
        case .all: return .get
        case .updateBookmark: return .get
        case .getBookmark: return .get
        }
    }
    
    var path: String {
        switch self {
        case .all: return "/"
        case .updateBookmark(let request): return "/mark/\(request.product_id)/"
        case .getBookmark: return "/mark/"
        }
    }
    
    var parameters: RequestParams? {
        switch self {
        case .all: return nil
        case .updateBookmark: return nil
        case .getBookmark: return nil
        }
    }
}
