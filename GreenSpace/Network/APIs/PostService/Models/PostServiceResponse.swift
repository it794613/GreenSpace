//
//  PostResponse.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/23.
//

import Foundation

struct PostServiceResponse: Decodable{
    let id : Int
    let image : String
    let text : String
    let created_at : String
    let updated_at : String
}

extension PostServiceResponse{
    func toDomain() {
        GlobalPostService.shared.array.append(Post(id: id, image: image, text: text, created_at: created_at, updated_at: updated_at))
    }
}
