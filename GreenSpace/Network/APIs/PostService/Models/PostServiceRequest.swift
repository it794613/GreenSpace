//
//  PostRequest.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/23.
//

import Foundation

struct PostRequest : Encodable{
    let id : Int
    let image : String
    let text : String
}
