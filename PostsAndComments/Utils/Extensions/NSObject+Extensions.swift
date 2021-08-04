//
//  NSObject+Extensions.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 03/08/21.
//

import Foundation

extension NSObject {

    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    var nameOfClass: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}
