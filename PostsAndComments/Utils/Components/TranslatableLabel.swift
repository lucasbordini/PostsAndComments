//
//  TranslatableLabel.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 03/08/21.
//

import UIKit

@IBDesignable
class TranslatableLabel: UILabel {

    @IBInspectable
    var stringKey: String = "" {
        didSet {
            self.text = NSLocalizedString(stringKey, comment: String())
        }
    }
}
