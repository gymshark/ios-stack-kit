//
//  Stacks.swift
//
//
//  Created by Russell Warwick on 01/05/2021.
//

import UIKit

public extension UIView {

    @discardableResult
    func ZStack(spacing: CGFloat = .zero, safeArea: Bool = false, @UIViewBuilder views: () -> [UIView]) -> UIView {
        let stack = VStack{}
        
        _ = views().map { (view: UIView) in
            stack.VStack { view }
        }
        
        return stack
    }

    @discardableResult
    func VStack(spacing: CGFloat = .zero, safeArea: Bool = false, @UIViewBuilder views: () -> [UIView]) -> UIStackView {
        return createStack(.vertical, views: views(), spacing: spacing, alignment: .fill, distribution: .fill, safeArea: safeArea)
    }

    @discardableResult
    func HStack(spacing: CGFloat = .zero, safeArea: Bool = false, @UIViewBuilder views: () -> [UIView]) -> UIStackView {
        return createStack(.horizontal, views: views(), spacing: spacing, alignment: .fill, distribution: .fill, safeArea: safeArea)
    }
}

public final class ZStack: UIView {
    
    init(spacing: CGFloat = .zero, @UIViewBuilder views: () -> [UIView]) {
        super.init(frame: .zero)
        
        let stack = VStack {}
        
        _ = views().map { (view: UIView) in
            stack.VStack { view }
        }
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

public final class VStack: UIStackView {
    init(spacing: CGFloat = .zero, @UIViewBuilder views: () -> [UIView]) {
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = spacing
        self.addArrangedSubViews(views())
    }

    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

public final class HStack: UIStackView {
    init(spacing: CGFloat = .zero, @UIViewBuilder views: () -> [UIView]) {
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
    func distribution(_ distribution: UIStackView.Distribution) -> UIStackView {
        self.distribution = distribution
        return self
    }
    
    @discardableResult
    func background(_ color: UIColor, cornerRadius: CGFloat = .zero) -> UIStackView {
        let view = UIView(frame: bounds)
        view.backgroundColor = color
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.layer.cornerRadius = cornerRadius
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        insertSubview(view, at: 0)
        return self
    }
}

public final class Space: UIView {

    // MARK: - Init
    
    public init() {
        super.init(frame: .zero)
    }
    
    public init(h: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: h).isActive = true
    }
    
    public init(w: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: w).isActive = true
    }

    required public init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension UIView {
    
    @discardableResult
    fileprivate func createStack(_ axis: NSLayoutConstraint.Axis = .vertical,
                            views: [UIView], spacing: CGFloat = .zero,
                            alignment: UIStackView.Alignment = .fill,
                            distribution: UIStackView.Distribution = .fill,
                            safeArea: Bool = true) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        if safeArea {
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
