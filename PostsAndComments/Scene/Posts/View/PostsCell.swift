//
//  PostsCell.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 03/08/21.
//

import UIKit

class PostsCell: UITableViewCell {

    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var bodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(with post: Post) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }

}
