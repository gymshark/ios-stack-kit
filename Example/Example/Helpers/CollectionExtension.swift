//
//  CollectionExtension.swift
//  Example
//
//  Created by Russell Warwick on 13/07/2021.
//

import UIKit

extension Collection {
    // Return element if within the bounds, else rerturn nil
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
