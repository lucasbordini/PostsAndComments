//
//  Comment.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 03/08/21.
//

import Foundation

struct Comment: Decodable {

    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
    
}
