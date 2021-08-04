//
//  PostsViewController.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 03/08/21.
//

import UIKit

class PostsViewController: UIViewController, ViewController {

    @IBOutlet weak private var postsTableView: UITableView!
    
    typealias T = PostsPresenter

    var presenter: PostsPresenter!

    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        attach()
    }

    private func setupTableView() {
        postsTableView.rowHeight = UITableView.automaticDimension
        postsTableView.estimatedRowHeight = 54
        postsTableView.register(UINib(nibName: Constants.NibName.postCell,
                                      bundle: Bundle(for: PostsViewController.self)),
                                forCellReuseIdentifier: Constants.Identifiers.postCell)
    }

    func attach() {
        presenter.attachViewController(self)
    }

    func inject(_ presenter: PostsPresenter) {
        self.presenter = presenter
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.dettachViewController()
    }

    func reloadTable(with posts: [Post]) {
        self.posts = posts
        postsTableView.reloadData()
    }

}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.postCell) as? PostsCell {
            cell.setupCell(with: posts[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        let vc = SceneFlow.shared.getCommentsView(for: post)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}
