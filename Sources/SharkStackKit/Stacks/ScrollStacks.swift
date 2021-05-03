//
//  ScrollStacks.swift
//
//
//  Created by Russell Warwick on 02/05/2021.
//

import UIKit

public extension UIView {

    @discardableResult
    func VScroll(safeArea: Bool = false, @UIViewBuilder views: () -> [UIView]) -> UIStackView {
        return VStack(safeArea: safeArea) {
            SharkStackKit.VScroll(views: views)
        }
    }

    @discardableResult
    func HScroll(safeArea: Bool = false, fill: Bool = true, @UIViewBuilder views: () -> [UIView]) -> UIStackView {
        return VStack(safeArea: safeArea) {
            SharkStackKit.HScroll(views: views)
            
            if !fill {
                Space()
            }
        }
    }
}

public final class VScroll: UIStackView {
    
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
    
    init(@UIViewBuilder views: () -> [UIView]) {
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
    }

    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

public final class HScroll: UIStackView {
    
    // MARK: - UI
    
    public var scrollView: UIScrollView = {
        let stackView = UIScrollView()
        stackView.alwaysBounceVertical = false
        stackView.alwaysBounceVertical = true
        return stackView
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        return stackView
    }()
    
    // MARK: - Init
    
    init(@UIViewBuilder views: () -> [UIView]) {
        super.init(frame: .zero)
        addArrangedSubview(scrollView)
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo:scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo:scrollView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo:scrollView.topAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])

        stackView.addArrangedSubViews(views())
    }

    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
