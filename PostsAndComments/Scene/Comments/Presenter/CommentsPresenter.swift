//
//  CommentsPresenter.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 04/08/21.
//

import Foundation
import Alamofire
import Combine

class CommentsPresenter: Presenter {

    typealias T = CommentsViewController

    internal var viewController: CommentsViewController?

    private var subscriptions = Set<AnyCancellable>()

    private let networkClient: NetworkClient!

    init(networkClient: NetworkClient?) {
        guard let networkClient = networkClient else { fatalError("networkClient need to be injected") }
        self.networkClient = networkClient
    }

    func loadComments(for post: Post) {
        viewController?.toggleLoading(show: true)
        guard let publisher: DataResponsePublisher<[Comment]> = networkClient.request(api: .message(postId: post.id)) else {
            setError()
            return

        }
        publisher.sink { [unowned self ] response in
            switch response.result {
            case let .success(comments):
                viewController?.reloadTable(with: comments)
                viewController?.toggleLoading(show: false)
                break
            case let .failure(error):
                print("Failed to load elements with error: \(error.localizedDescription)")
                setError()
            }
        }.store(in: &subscriptions)
    }

    private func setError() {
        viewController?.toggleLoading(show: false)
        viewController?.showAlert(message: LocalizableKey.Errors.fetchCommentsFail.localized)
    }
}
