//
//  UIViewHelpers.swift
//  
//
//  Created by Russell Warwick on 03/07/2021.
//

import UIKit

public extension UIView {
    @discardableResult
    func withBackground(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }
}

extension UIStackView {
    func addArrangedSubViews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
}
