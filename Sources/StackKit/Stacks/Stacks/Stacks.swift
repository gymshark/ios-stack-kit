//
//  Stacks.swift
//
//
//  Created by Russell Warwick on 01/05/2021.
//

import UIKit

// MARK: - UIView Extension Variants

public extension UIView {

    @discardableResult
    func ZStack(useSafeArea: Bool = true, @UIViewBuilder views: () -> [UIView]) -> UIStackView {
        let container = UIView()
        
        views().forEach { view in
            container.VStack { view }
        }

        return VStack { container }
    }

    @discardableResult
    func VStack(spacing: CGFloat = .zero, useSafeArea: Bool = true, @UIViewBuilder views: () -> [UIView]) -> UIStackView {
        return createStack(.vertical, views: views(), spacing: spacing, alignment: .fill, distribution: .fill, useSafeArea: useSafeArea)
    }

    @discardableResult
    func HStack(spacing: CGFloat = .zero, useSafeArea: Bool = true, @UIViewBuilder views: () -> [UIView]) -> UIStackView {
        return createStack(.horizontal, views: views(), spacing: spacing, alignment: .fill, distribution: .fill, useSafeArea: useSafeArea)
    }
}

// MARK: - Class Variants

public final class ZStack: UIStackView {
    public init(@UIViewBuilder views: () -> [UIView]) {
        super.init(frame: .zero)
        
        let container = UIView()
        
        views().forEach { view in
            container.VStack { view }
        }
        
        addArrangedSubview(container)
    }

    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

public final class VStack: UIStackView {
    public init(spacing: CGFloat = .zero, @UIViewBuilder views: () -> [UIView]) {
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = spacing
        self.addArrangedSubViews(views())
    }

    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

public final class HStack: UIStackView {
    public init(spacing: CGFloat = .zero, @UIViewBuilder views: () -> [UIView]) {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = spacing
        self.addArrangedSubViews(views())
    }

    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

// MARK: - Extensions

public extension UIStackView {

    @discardableResult
    func margin(_ margins: UIEdgeInsets) -> UIStackView {
        layoutMargins = margins
        isLayoutMarginsRelativeArrangement = true
        return self
    }

    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> UIStackView {
        self.alignment = alignment
        return self
    }
    
    @discardableResult
    func spacing(_ spacing: CGFloat) -> UIStackView {
        self.spacing = spacing
        return self
    }

    @discardableResult
    func distribution(_ distribution: UIStackView.Distribution) -> UIStackView {
        self.distribution = distribution
        return self
    }
    
    @discardableResult
    func withBackground(_ color: UIColor, cornerRadius: CGFloat = .zero) -> UIStackView {
        let view = UIView(frame: bounds)
        view.backgroundColor = color
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.layer.cornerRadius = cornerRadius
		if #available(iOS 11.0, *) {
			view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
		}
        insertSubview(view, at: 0)
        return self
    }
    
    @discardableResult
    func removeAllArrangedSubviews() -> [UIView] {
        return arrangedSubviews.reduce([]) { (removedSubviews, subview) -> [UIView] in
            removeArrangedSubview(subview)
            NSLayoutConstraint.deactivate(subview.constraints)
            subview.removeFromSuperview()
            return removedSubviews + [subview]
        }
    }
}
