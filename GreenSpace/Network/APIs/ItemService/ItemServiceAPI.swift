//
//  ItemServiceAPI.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation
import Alamofire

struct ItemAPI {
    static func getBuy(completion: @escaping (_ succeed: [Buy]?, _ failed: Error?) -> Void) {
        AF.request(ItemServiceTarget.getBuy, interceptor: MyRequestInterceptor())
            .responseDecodable(of: [BuyResponse].self) { (response) in
                    switch response.result {
                    case .success(let response):
                        GlobalBuy.shared.array = []
                        response.forEach { $0.toDomain(to: "") }
                        completion(GlobalBuy.shared.array, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
    }
    
    static func updateBuy(request: BuyRequest, completion: @escaping (_ succeed: [Buy]?, _ failed: Error?) -> Void) {
        AF.request(ItemServiceTarget.updateBuy(request), interceptor: MyRequestInterceptor())
            .responseDecodable(of: [BuyResponse].self) { (response) in
                    switch response.result {
                    case .success(let response):
                        GlobalBuy.shared.array = []
                        response.forEach { $0.toDomain(to: "") }
                        completion(GlobalBuy.shared.array, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
    }
    
    static func deleteBuy(request: BuyRequest, completion: @escaping (_ succeed: Bool?, _ failed: Error?) -> Void) {
        AF.request(ItemServiceTarget.deleteBuy(request), interceptor: MyRequestInterceptor())
            .responseDecodable(of: MessageResponse.self) { (response) in
                    switch response.result {
                    case .success:
                        completion(true, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
    }
    
    static func patchBuy(request: BuyRequest, completion: @escaping (_ succeed: [Buy]?, _ failed: Error?) -> Void) {
        AF.request(ItemServiceTarget.patchBuy(request), interceptor: MyRequestInterceptor())
            .responseDecodable(of: [BuyResponse].self) { (response) in
                    switch response.result {
                    case .success(let response):
                        GlobalBuy.shared.array = []
                        response.forEach { $0.toDomain(to: "") }
                        completion(GlobalBuy.shared.array, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
    }
    
    static func getAllItem(completion: @escaping (_ succeed: [Item]?, _ failed: Error?) -> Void) {
        AF.request(ItemServiceTarget.getAllItem, interceptor: MyRequestInterceptor())
            .responseDecodable(of: [ItemResponse].self) { (response) in
                    switch response.result {
                    case .success(let response):
                        GlobalItem.shared.array = []
                        response.forEach { $0.toDomain() }
                        completion(GlobalItem.shared.array, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
    }
    
    static func getBadge(completion: @escaping (_ succeed: [Item]?, _ failed: Error?) -> Void) {
        AF.request(ItemServiceTarget.getBadge, interceptor: MyRequestInterceptor())
            .responseDecodable(of: [BadgeResponse].self) { (response) in
                    switch response.result {
                    case .success(let response):
                        GlobalBadge.shared.array = []
                        response.forEach { $0.toDomain() }
                        completion(GlobalBadge.shared.array, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
    }
    
    static func getOtherBuy(request: SpaceRequest,completion: @escaping (_ succeed: [Buy]?, _ failed: Error?) -> Void) {
        AF.request(ItemServiceTarget.getOtherBuy(request), interceptor: MyRequestInterceptor())
            .responseDecodable(of: [BuyResponse].self) { (response) in
                    switch response.result {
                    case .success(let response):
                        GlobalBuy.shared.otherArray = []
                        response.forEach { $0.toDomain(to: "Other") }
                        completion(GlobalBuy.shared.otherArray, nil)
                    case .failure(let error):
                        print(error)
                        completion(nil, error)
                    }
                }
    }
}
