//
//  LoadView.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 03/08/21.
//

import UIKit

class LoadView: UIView {

    @IBOutlet weak private var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed(LoadView.nameOfClass, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = UIScreen.main.bounds
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
}
