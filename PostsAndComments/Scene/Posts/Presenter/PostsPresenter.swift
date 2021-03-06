//
//  PostsPresenter.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 03/08/21.
//

import Foundation
import Combine
import Alamofire

class PostsPresenter: Presenter {

    typealias T = PostsViewController

    private var subscriptions = Set<AnyCancellable>()

    internal var viewController: PostsViewController?

    private let networkClient: NetworkClient!

    init(_ networkClient: NetworkClient?) {
        guard let networkClient = networkClient else { fatalError("networkClient need to be injected") }
        self.networkClient = networkClient
        viewController?.toggleLoading(show: true)
        self.loadPosts()
    }

    private func loadPosts() {
        guard let publisher: DataResponsePublisher<[Post]> = networkClient.request(api: .posts) else {
            setError()
            return
        }
        publisher.sink { [unowned self ] response in
            switch response.result {
            case let .success(posts):
                viewController?.reloadTable(with: posts)
                viewController?.toggleLoading(show: false)
            case let .failure(error):
                print("Failed to load elements with error: \(error.localizedDescription)")
                setError()
            }
        }.store(in: &subscriptions)
    }

    private func setError() {
        viewController?.toggleLoading(show: false)
        viewController?.showAlert(message: LocalizableKey.Errors.fetchPostsFail.localized)
    }

    
}
