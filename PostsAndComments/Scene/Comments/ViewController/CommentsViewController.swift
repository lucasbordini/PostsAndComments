//
//  CommentsViewController.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 04/08/21.
//

import UIKit

class CommentsViewController: UIViewController, ViewController {

    typealias T = CommentsPresenter

    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var commentsTableView: UITableView!

    private var comments: [Comment] = []

    var presenter: CommentsPresenter!
    var post: Post!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()
        setupTitle()
        setupTableView()
        attach()
        presenter.loadComments(for: post)
    }

    func inject(_ presenter: CommentsPresenter?, _ post: Post) {
        guard let presenter = presenter else { fatalError("presenter need to be injected") }
        self.presenter = presenter
        self.post = post
    }

    internal func attach() {
        presenter.attachViewController(self)
    }

    private func setupTitle() {
        titleLabel.text = LocalizableKey.Screens.CommentsScreen.screenTitle.with(args: post.title)
    }

    private func setupTableView() {
        commentsTableView.rowHeight = UITableView.automaticDimension
        commentsTableView.estimatedRowHeight = 54
        commentsTableView.register(UINib(nibName: Constants.NibName.commentsCell,
                                         bundle: Bundle(for: Self.self)),
                                   forCellReuseIdentifier: Constants.Identifiers.commentsCell)
    }

    private func setupGesture() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(close))
        swipeGesture.direction = .down
        view.addGestureRecognizer(swipeGesture)
    }

    @objc
    private func close() {
        dismiss(animated: true)
    }

    public func reloadTable(with comments: [Comment]) {
        self.comments = comments
        commentsTableView.reloadData()
    }
}

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.commentsCell) as? CommentsCell {
            cell.setupCell(with: comments[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
