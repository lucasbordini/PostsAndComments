//
//  Constants.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 03/08/21.
//

import Foundation

enum Constants {

    enum Network {
        static let BaseURL = "https://jsonplaceholder.typicode.com/"
    }

    enum NibName {
        static let postCell = "PostsCell"
        static let commentsCell = "CommentsCell"
    }

    enum Identifiers {
        static let postCell = "PostCellIdentifier"
        static let commentsCell = "CommentsCellIdentifier"
    }

    enum ViewControllers {
        static let comments = "CommentsViewController"
    }

    enum Storyboards {
        static let comments = "Comments"
    }
}
