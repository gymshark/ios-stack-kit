//
//  Stacks.swift
//
//
//  Created by Russell Warwick on 01/05/2021.
//

import UIKit

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

public final class ZStack: UIStackView {
    
    public init(@UIViewBuilder views: () -> [UIView]) {
        super.init(frame: .zero)
        self.axis = .vertical
        
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
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        insertSubview(view, at: 0)
        return self
    }
}

extension UIView {
    
    @discardableResult
    fileprivate func createStack(_ axis: NSLayoutConstraint.Axis = .vertical,
                            views: [UIView], spacing: CGFloat = .zero,
                            alignment: UIStackView.Alignment = .fill,
                            distribution: UIStackView.Distribution = .fill,
                            useSafeArea: Bool) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        if useSafeArea {
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: .zero),
                stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: .zero),
                stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: .zero),
                stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: .zero)
            ])
        } else {
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: topAnchor, constant: .zero),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero)
            ])
        }

        return stackView
    }
}
