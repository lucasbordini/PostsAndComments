//
//  CommentsCell.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 04/08/21.
//

import UIKit

class CommentsCell: UITableViewCell {

    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var emailLabel: UILabel!
    @IBOutlet weak private var bodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(with comment: Comment) {
        nameLabel.text = comment.name
        emailLabel.text = comment.email
        bodyLabel.text = comment.body
    }
}
