//
//  ItemServiceTarget.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation
import Alamofire

enum ItemServiceTarget {
    case getBuy
    case updateBuy(BuyRequest)
    case deleteBuy(BuyRequest)
    case patchBuy(BuyRequest)
    case getAllItem
    case getBadge
    case getOtherBuy(SpaceRequest)
}

extension ItemServiceTarget: TargetType {
    
    var baseURL: String {
        return "https://greenspaceapi.herokuapp.com/shop"
    }
    
    var method: HTTPMethod {
        switch self {
        case .getBuy: return .get
        case .updateBuy: return .post
        case .deleteBuy: return .delete
        case .patchBuy: return .patch
        case .getAllItem: return .get
        case .getBadge: return .get
        case .getOtherBuy: return .post
        }
    }
    
    var path: String {
        switch self {
        case .getBuy: return "/buy/"
        case .updateBuy: return "/buy/"
        case .deleteBuy: return "/buy/"
        case .patchBuy: return "/buy/"
        case .getAllItem: return "/items/"
        case .getBadge: return "/badges/"
        case .getOtherBuy: return "/space/"
        }
    }
    
    var parameters: RequestParams? {
        switch self {
        case .getBuy: return nil
        case .updateBuy(let request): return .body(request)
        case .deleteBuy(let request): return .body(request)
        case .patchBuy(let request): return .body(request)
        case .getAllItem: return nil
        case .getBadge: return nil
        case .getOtherBuy(let request): return .body(request)
        }
    }

}
