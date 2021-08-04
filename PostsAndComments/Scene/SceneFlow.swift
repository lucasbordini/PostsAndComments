//
//  SceneFlow.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 04/08/21.
//

import Foundation
import Swinject
import SwinjectStoryboard

class SceneFlow {

    static let shared = SceneFlow()

    var container = Container() { r in
        r.register(NetworkClient.self, factory: { _ in
            ServerClient()
        })
        r.register(CommentsPresenter.self, factory: { _ in
            CommentsPresenter(networkClient: r.resolve(NetworkClient.self))
        })
        r.storyboardInitCompleted(CommentsViewController.self, name: Constants.ViewControllers.comments, initCompleted: { _,_ in })
    }

    func getCommentsView(for post: Post) -> CommentsViewController {
        let sb = SwinjectStoryboard.create(name: Constants.Storyboards.comments, bundle: nil, container: container)
        let commentsViewController = sb.instantiateViewController(identifier: Constants.ViewControllers.comments) as! CommentsViewController
        commentsViewController.inject(container.resolve(CommentsPresenter.self), post)
        return commentsViewController
    }

}
