//
//  TagView.swift
//  Example
//
//  Created by Russell Warwick on 18/07/2021.
//

import UIKit
import StackKit
import SharkUtils

final class TagView: UIView {
    
    // MARK: - UI
    
    private let label = UILabel().with {
        $0.font = .systemFont(ofSize: 11.5, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    // MARK: - Init
    
    init(){
        super.init(frame: .zero)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Interface
    
    var text: String? {
        didSet {
            label.text = text
        }
    }

    // MARK: - Configure
    
    private func configure(){
        backgroundColor = .init(white: 0.15, alpha: 0.95)
        alpha = 0.95
        setCornerRadius(4)
    }
    
    private func setConstraints(){
        VStack {
            label
        }.margin(.horizontal(12))
        .withHeight(30)
    }
}
