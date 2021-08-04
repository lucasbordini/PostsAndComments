//
//  ViewController.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 03/08/21.
//

import UIKit

protocol ViewController: UIViewController {

    associatedtype T: Presenter

    var presenter: T! { get }

    func attach()

    func toggleLoading(show: Bool)
    func showAlert(message: String)
}

extension ViewController {

    func toggleLoading(show: Bool) {
        if show {
            let loading = LoadView()
            loading.tag = 1
            self.view.addSubview(loading)
        } else {
            DispatchQueue.main.async {
                self.view.viewWithTag(1)?.removeFromSuperview()
            }
        }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: LocalizableKey.General.ok.localized, style: .cancel, handler: { _ in
            alert.dismiss(animated: true)
        }))
        present(alert, animated: true)
    }

}

