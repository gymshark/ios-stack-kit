//
//  ScrollStacks.swift
//
//
//  Created by Russell Warwick on 02/05/2021.
//

import UIKit
import SharkUtils

public extension UIView {

    @discardableResult
    func VScroll(spacing: CGFloat = .zero, useSafeArea: Bool = true, @UIViewBuilder views: () -> [UIView]) -> UIStackView {
        return VStack(useSafeArea: useSafeArea) {
            VScrollView(spacing: spacing, views: views)
        }
    }
}

public final class VScrollView: UIStackView {
    
    // MARK: - UI
    
    public var scrollView: UIScrollView = {
        let stackView = UIScrollView()
        stackView.alwaysBounceVertical = true
        stackView.alwaysBounceHorizontal = false
        return stackView
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        return stackView
    }()
    
    // MARK: - Init
    
    public init(spacing: CGFloat = .zero, @UIViewBuilder views: () -> [UIView]) {
        super.init(frame: .zero)

        addArrangedSubview(scrollView)
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo:scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo:scrollView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo:scrollView.topAnchor),
            stackView.widthAnchor.constraint(equalTo:scrollView.widthAnchor)
        ])

        stackView.addArrangedSubViews(views())
        stackView.spacing(spacing)
    }

    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
