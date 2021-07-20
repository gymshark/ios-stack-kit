//
//  SizingConstraints.swift
//  
//
//  Created by Russell Warwick on 08/07/2021.
//

import UIKit

public extension UIView {
    
    // MARK: - Width
    
    @discardableResult
    func withWidth(_ value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return withFixed(width: value, priority: priority)
    }
    
    @discardableResult
    func withWidth(lessThan value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return withMinimum(width: value, priority: priority)
    }
    
    @discardableResult
    func withWidth(greaterThan value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return withMinimum(width: value, priority: priority)
    }
}

public extension UIView {
    
    // MARK: - Height

    @discardableResult
    func withHeight(_ value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return withFixed(height: value, priority: priority)
    }

    @discardableResult
    func withHeight(lessThan value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return withMinimum(height: value, priority: priority)
    }

    @discardableResult
    func withHeight(greaterThan value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return withMinimum(height: value, priority: priority)
    }
}

public extension UIView {
    
    @discardableResult
    func withSquare(_ value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return withFixed(width: value, height: value, priority: priority)
    }

    @discardableResult
    func withSize(_ value: CGSize, priority: UILayoutPriority = .required) -> Self {
        return withFixed(width: value.width, height: value.height, priority: priority)
    }
    
    @discardableResult
    func withMinimum(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                width.flatMap { widthAnchor.constraint(greaterThanOrEqualToConstant: $0) },
                height.flatMap { heightAnchor.constraint(greaterThanOrEqualToConstant: $0) }
            ]
            .compactMap {
                $0?.priority = priority
                return $0
            }
        )
        return self
    }

    @discardableResult
    func withMaximum(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                width.flatMap { widthAnchor.constraint(lessThanOrEqualToConstant: $0) },
                height.flatMap { heightAnchor.constraint(lessThanOrEqualToConstant: $0) }
            ]
            .compactMap {
                $0?.priority = priority
                return $0
            }
        )
        return self
    }

    @discardableResult
    func withFixed(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                width.flatMap { widthAnchor.constraint(equalToConstant: $0) },
                height.flatMap { heightAnchor.constraint(equalToConstant: $0) }
            ]
            .compactMap {
                $0?.priority = priority
                return $0
            }
        )
        return self
    }

    @discardableResult
    func withAspectRatio(_ value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        let anchor = widthAnchor.constraint(equalTo: heightAnchor, multiplier: value)
        anchor.priority = priority
        NSLayoutConstraint.activate([ anchor ])
        return self
    }

    @discardableResult
    func withAspectRatio(greaterThanOrEqualTo value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        let anchor = widthAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: value)
        anchor.priority = priority
        NSLayoutConstraint.activate([ anchor ])
        return self
    }
}
