//
//  Localizable.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 03/08/21.
//

import Foundation


enum LocalizableKey {

    enum General: String {
        case ok = "ok"

        var localized: String {
            return NSLocalizedString(self.rawValue, comment: "")
        }
    }

    enum Errors: String {
        case fetchPostsFail = "fetch_posts_fail"
        case fetchCommentsFail = "fetch_comments_fail"

        var localized: String {
            return NSLocalizedString(self.rawValue, comment: "")
        }
    }

    enum Screens {
        enum PostsScreen: String {
            case screenTitle = "posts_screen_title"

            var localized: String {
                return NSLocalizedString(self.rawValue, comment: "")
            }
        }

        enum CommentsScreen: String {
            case screenTitle = "comments_screen_title"

            var localized: String {
                return NSLocalizedString(self.rawValue, comment: "")
            }

            func with(args: CVarArg) -> String {
                return String(format: localized, args)
            }
        }
    }
}
