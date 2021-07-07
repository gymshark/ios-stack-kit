//
//  ScrollStacks.swift
//
//
//  Created by Russell Warwick on 02/05/2021.
//

import UIKit
import ConstraintKit

// MARK: - UIView Extension Variants

public extension UIView {

    @discardableResult
    func VScroll(useSafeArea: Bool = true, @UIViewBuilder views: () -> [UIView]) -> ScrollViewBuilder {
        let scrollView = ScrollViewBuilder(axis: .vertical, views: views)
        
        VStack(useSafeArea: useSafeArea) { scrollView }
        
        return scrollView
    }
    
    @discardableResult
    func HScroll(useSafeArea: Bool = true, @UIViewBuilder views: () -> [UIView]) -> ScrollViewBuilder {
        let scrollView = ScrollViewBuilder(axis: .horizontal, views: views)
        
        VStack(useSafeArea: useSafeArea) { scrollView }
        
        return scrollView
    }
}

// MARK: - Class Variants

public class HScroll: ScrollViewBuilder {
    public init(@UIViewBuilder views: () -> [UIView]) {
        super.init(axis: .horizontal, views: views)
    }
    
    public required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

public class VScroll: ScrollViewBuilder {
    public init(@UIViewBuilder views: () -> [UIView]) {
        super.init(axis: .vertical, views: views)
    }
    
    public required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
