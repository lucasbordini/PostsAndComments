//
//  Presenter.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 03/08/21.
//

import Foundation

protocol Presenter: AnyObject {

    associatedtype T

    var viewController: T? {get set}

    func attachViewController(_ vc: T)
    func dettachViewController()

}

extension Presenter {

    func attachViewController(_ vc: T) {
        self.viewController = vc
    }

    func dettachViewController() {
        self.viewController = nil
    }
}
