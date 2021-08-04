//
//  Posts.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 03/08/21.
//

import Foundation

struct Post: Decodable {

    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}
