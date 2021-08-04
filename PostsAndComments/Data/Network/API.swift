//
//  API.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 03/08/21.
//

import Foundation

enum API {

    case posts
    case message(postId: Int)

}

extension API {

    var path: String {
        switch self {
        case .posts:
            return "posts"
        case .message(let postId):
            return "\(postId)/comments"
        }
    }
    
}
